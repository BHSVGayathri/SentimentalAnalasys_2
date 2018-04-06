package info.mining;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class RetriveProductIndividualDetServlet extends HttpServlet {

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) {

        Connection con = null;
        ResultSet rs = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;
        RequestDispatcher rd = null;
        String pid = "";
        String pname = "";
        String acost = "";
        String dcost = "";
        String description = "";
        String image = "";
        String id = request.getParameter("submit");
        if(id=="" || id==null){
            id = (String) request.getAttribute("submit");
        }
        System.out.println(id);
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.setAttribute("pid", id);
            try {
                DbConnection db = new DbConnection();
                con = db.getConnections();
                String query = "select * from product where pid=?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, id);
                rs = pstmt.executeQuery();

                List list = new ArrayList();
                while (rs.next()) {
                    Product p = new Product();
                    p.setPid(rs.getLong(1));
                    p.setPname(rs.getString(2));
                    p.setAcost(rs.getString(3));
                    p.setDcost(rs.getString(4));
                    p.setDescription(rs.getString(5));
                    p.setImage(rs.getString(6));
                    list.add(p);

                }
                request.setAttribute("list", list);
                System.out.println("list");

                String query1 = "select * from comments where pid=?";
                PreparedStatement pstmt1 = con.prepareStatement(query1);
                pstmt1.setString(1, id);
                ResultSet rs1 = pstmt1.executeQuery();

                List list1 = new ArrayList();
                while (rs1.next()) {
                    Comments c = new Comments();

                    c.setId(rs1.getString(1));
                    c.setPid(rs1.getString(2));
                    c.setUname(rs1.getString(3));
                    c.setUid(rs1.getString(4));
                    c.setComments(rs1.getString(5));
                    c.setRating(rs1.getInt(6));

                    list1.add(c);

                }
                request.setAttribute("list1", list1);


                String query2 = "select comments from comments where pid=? GROUP BY ID DESC LIMIT 100";
                PreparedStatement pstmt2 = con.prepareStatement(query2);
                pstmt2.setString(1, id);
                ResultSet rs2 = pstmt2.executeQuery();

                List list2 = new ArrayList();
                while (rs2.next()) {
                    //Comments c = new Comments();

                    //c.setComments();
                    list2.add(rs2.getString(1));

                }
                Map sentiMap = getSentimenatlMap(list2);
                request.setAttribute("sentiMap", sentiMap);
                System.out.println(sentiMap.toString());
                rd = request.getRequestDispatcher("DisplayIndividualProducts.jsp");
                rd.forward(request, response);


            } catch (Exception e) {

                e.printStackTrace();
            }

        } else {
        }


    }

    private Map getSentimenatlMap(List commentsList) {

        List<String> posWords = new ArrayList<String>();
        List<String> negWords = new ArrayList<String>();
        List<String> negaingWords = new ArrayList<String>();
        int positive = 0;
        int negative = 0;
        int neutral = 0;
        double posPercentage = 0;
        double neuPercentage = 0;
        int star = 0;
        Map deatilsMap = new HashMap();
        //ArrayList<String> commentsList = new ArrayList<String>();
        String strPosWords = "great,awesome,accept,acceptance,admirable,advantage,advantage,slim,aim,accuracy,achievement,achieve,adventure,affection,appreciation,appreciate,attraction,attracting,beatify,beneficial,benefit,beauty,beloved,best,better,bless,blessng,beauty,beautiful,cool,care,capable,celebrate,clean,comfort,caring,commitment,concentration,confidence,cooperation,creativity,curiosity,decent, desirable,delicious,dream,dreamy,dynamic,easy,easily,efficient,enjoy,eagerness,effectiveness,efficiency,enthusiasm,excite,excitement,experience,,excellent,expertise,fantastic,feel good,gud,agood,fabulous,fair,favorite,flexibility,fun,future,fast,genius,genuine,gift,good,goodness,goodness,good feeling,happiness, happy,happily,high,humble,in love,incredible,innovate,interesting,interest,interested,improvement,joy,joyful,like,learn,luxury,longevity,love,love,lovable,learning,liberty,logic,luck,lucky,loving,kindness,magnificent,marvelous,miracle,magic,making a difference,new,nice,optimist,optimistic,outstanding,optimistic,ok,perfect,portable,perfection,quality,secured,security,useful,true, trusting,thankful,trust,truth,work,worth,worthy,wonderful,good,excellent,awesome,superb,verynice,verygood,verygud,cool,aweful,fun,happy";
        String strNegWords = "angry,awful,abad,bad,boring,broken,collapse,confused,cry,dead,damage,less,depressed,dirty,dishonest,distress,faulty,fear,feeble,filthy,foul,guilty,hard,harmful,hate,horrible,hurt,hurtful,ignore,ignorant,imperfect,impossible,inelegant,lose,misshapen,missing,odd,nasty,negative,never,no,nonsense,pain,poor,quit,reject,reject,repulsive,slow,low,sad,scare,shocking,stressful,stupid,suspect,suspicious,terrible,terrifying,threatening,ugly,undermine,unfair,unfavorable,unhappy,unhealthy,unpleasant,upset,unsatisfactory,unsightly,untoward,unwanted,unwelcome,unwholesome,unwieldy,unwise,upset,verybad,worthless";
        String strNegatingWords = "aren't,arent,can't,cannot,cant,couldn't,couldnt,doesn't,doesnt,don't,dont,isn't,isnt,never,not,notso,won't,wont,wouldn't,wouldnt";
        posWords = Arrays.asList(strPosWords.split(","));
        negWords = Arrays.asList(strNegWords.split(","));
        negaingWords = Arrays.asList(strNegatingWords.split(","));

        if (commentsList.size() > 0) {
            for (int i = 0; i < commentsList.size(); i++) {
                String comment = (String) commentsList.get(i);
                int score = getSentimentScore(comment, posWords, negWords, negaingWords);
                if (score == 1) {
                    positive++;
                } else if (score == -1) {
                    negative++;
                } else {
                    neutral++;
                }
            }
            posPercentage = positive * 100 / commentsList.size();
            
            if (posPercentage < 20) {
                star = 1;
            } else if (posPercentage > 20 && posPercentage < 40) {
                star = 2;
            } else if (posPercentage > 40 && posPercentage < 60) {
                star = 3;
            } else if (posPercentage > 60 && posPercentage < 80) {
                star = 4;
            } else if (posPercentage > 80 && posPercentage <= 100) {
                star = 5;
            }


        }


        deatilsMap.put("positiveCount", positive);
        deatilsMap.put("negativeCount", negative);
        deatilsMap.put("neutraleCount", neutral);
        deatilsMap.put("starCount", star);

        //System.out.println("Score:: " + score);

        return deatilsMap;
    }

    private int getSentimentScore(String input, List<String> posWords, List<String> negWords, List<String> negaingWords) {
// normalize!
        input = input.toLowerCase();
        input = input.trim();
// remove all non alpha-numeric non whitespace chars
        input = input.replaceAll("[^a-zA-Z0-9\\s.]", "");

        int negCounter = 0;
        int posCounter = 0;

// so what we got?
        String[] words = input.split(" ");

// check if the current word appears in our reference lists...
        String previousWord = "";
        for (int i = 0; i < words.length; i++) {
            if (posWords.contains(words[i])) {
                if (negaingWords.contains(previousWord)) {
                    negCounter++;
                } else {
                    posCounter++;
                }
            }
            if (negWords.contains(words[i])) {
                if (negaingWords.contains(previousWord)) {
                    posCounter++;
                } else {
                    negCounter++;
                }
            }
            previousWord = words[i];
        }

// positive matches MINUS negative matches
        int result = (posCounter - negCounter);

// negative?
        if (result < 0) {
            return -1;
// or positive?
        } else if (result > 0) {
            return 1;
        }

// neutral to the rescue!
        return 0;
    }
}
