package com.util;

import java.util.*;

/**
 * 描述：对课件收藏过用1表示，0代表没收藏过。
 * 给目标用户推荐相似度最高用户喜欢的课件
 */
public class ItemCFDemo {

	//系统用户
	public static String[] users={"小明","小花","小美","小张","小李","小王","小徐"};
    //和这些用户相关的课件
	public static String[] movies={"课件1","课件2","课件3","课件4"};
    //用户收藏课件情况
	public static Integer[][] allUserMovieCommentList={
            {0,1,0,0},
            {0,0,0,0},
            {0,0,0,0},
            {0,0,0,0},
            {0,0,0,0},
            {0,0,0,0},
            {0,0,0,1}
    };
	
    public static int membernum = 0; //会员数  7
    public static int mvnum = 0;//课件数  4
    
    //用户收藏课件情况，行转列
    private static Integer[][] allMovieCommentList=new Integer[allUserMovieCommentList[0].length][allUserMovieCommentList.length];
    //课件相似度
    private static HashMap<String,Double> movieABSimilaritys=null;
    //待推荐课件相似度列表
    private static HashMap<Integer,Object> movieSimilaritys=null;
    //用户所在的位置
    private static Integer targetUserIndex=null;
    //目标用户收藏过的课件
    private static List<Integer> targetUserCommentedMovies=null;
    //推荐课件
    private static  List<Map.Entry<Integer, Object>> recommlist=null;
    public static List mvlist(String realname){
//    	for(int m=0;m<allUserMovieCommentList.length;m++){
//    		for(int n=0;n<allUserMovieCommentList[m].length;n++){
//    			System.out.println(allUserMovieCommentList[m][n]+"  ");
//    		}
//    		System.out.println();
//    	}
    	allMovieCommentList=new Integer[allUserMovieCommentList[0].length][allUserMovieCommentList.length];
    	ArrayList rtnlist = new ArrayList();
    	
            targetUserIndex=getUserIndex(realname);
            if(targetUserIndex==null){
                System.out.println("没有搜索到此用户");
            }else{
            	//转换目标用户课件收藏列表
                targetUserCommentedMovies=Arrays.asList(allUserMovieCommentList[targetUserIndex]);
                //计算课件相似度
                calcAllMovieSimilaritys();
                //获取全部待推荐课件
                calcRecommendMovie();
                //输出推荐课件
                System.out.print("推荐课件列表：");
                for (Map.Entry<Integer, Object> item:recommlist){
                    System.out.print(movies[item.getKey()]+"  ");
                }
                System.out.println();
            	
            	//----------------
            	
            	//计算课件相似度
                calcAllMovieSimilaritys();
                //获取全部待推荐课件
                calcRecommendMovie();
                //输出推荐课件
                System.out.print("推荐课件列表：");
                for (Map.Entry<Integer, Object> item:recommlist){
                    System.out.print("xx=="+movies[item.getKey()]+"  ");
                    rtnlist.add(movies[item.getKey()]);
                }
                
                //输出推荐课件
                //System.out.print("推荐课件列表：");
//                for (String item:recommlist){
//                    if(!commentedMovies.contains(item)){
//                    	//System.out.println("item=="+item);
//                        //System.out.print(item+"  ");
//                        rtnlist.add(item);
//                    }
//                }
            }

            //targetRecommendMovies=null;
            //System.out.println("rtnlist="+rtnlist.size());
        return rtnlist;
    }
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        String user=scanner.nextLine();
        while (user!=null && !"exit".equals(user)){
            targetUserIndex=getUserIndex(user);
            if(targetUserIndex==null){
                System.out.println("没有搜索到此用户，请重新输入：");
            }else{
                //转换目标用户课件收藏列表
                targetUserCommentedMovies=Arrays.asList(allUserMovieCommentList[targetUserIndex]);
                //计算课件相似度
                calcAllMovieSimilaritys();
                //获取全部待推荐课件
                calcRecommendMovie();
                //输出推荐课件
                System.out.print("推荐课件列表：");
                for (Map.Entry<Integer, Object> item:recommlist){
                    System.out.print(movies[item.getKey()]+"  ");
                }
                System.out.println();
            }

            user=scanner.nextLine();
        }

    }

    /**
     * 获取全部推荐课件
     */
    private static void calcRecommendMovie(){
        movieSimilaritys=new HashMap<Integer,Object>();
        for (int i=0;i<targetUserCommentedMovies.size()-1;i++){
            for (int j=i+1;j<targetUserCommentedMovies.size();j++){
                Object similarity=null;
                if(targetUserCommentedMovies.get(i)==1 &&  targetUserCommentedMovies.get(j)==0 && ( movieABSimilaritys.get(i+""+j)!=null || movieABSimilaritys.get(j+""+i)!=null)){
                    similarity=movieABSimilaritys.get(i+""+j)!=null?movieABSimilaritys.get(i+""+j):movieABSimilaritys.get(j+""+i);
                    movieSimilaritys.put(j,similarity);
                }else if(targetUserCommentedMovies.get(i)==0 &&  targetUserCommentedMovies.get(j)==1 && (movieABSimilaritys.get(i+""+j)!=null || movieABSimilaritys.get(j+""+i)!=null)){
                    similarity=movieABSimilaritys.get(i+""+j)!=null?movieABSimilaritys.get(i+""+j):movieABSimilaritys.get(j+""+i);
                    movieSimilaritys.put(i,similarity);
                }
            }
        }

        recommlist = new ArrayList<Map.Entry<Integer, Object>>(movieSimilaritys.entrySet());
        Collections.sort(recommlist, new Comparator<Map.Entry<Integer, Object>>() {
            @Override
            public int compare(Map.Entry<Integer, Object> o1, Map.Entry<Integer, Object> o2) {
                return o1.getValue().toString().compareTo(o2.getValue().toString());
            }
        });

        System.out.println("待推荐相似度课件列表："+recommlist);
    }

    /**
     * 计算全部物品间的相似度
     */
    private static void calcAllMovieSimilaritys(){
        converRow2Col();
        movieABSimilaritys=new HashMap<String,Double>();
        for (int i=0;i<allMovieCommentList.length-1;i++){
            for (int j=i+1;j<allMovieCommentList.length;j++){
                movieABSimilaritys.put(i+""+j,calcTwoMovieSimilarity(allMovieCommentList[i],allMovieCommentList[j]));
            }
        }

        System.out.println("课件相似度："+movieABSimilaritys);
    }


    /**
     * 根据课件全部收藏数据，计算两个课件相似度
     * @param movie1Stars
     * @param movie2Starts
     * @return
     */
    private static double calcTwoMovieSimilarity(Integer[] movie1Stars,Integer[] movie2Starts){
        float sum=0;
        for(int i=0;i<movie1Stars.length;i++){
            sum+=Math.pow(movie1Stars[i]-movie2Starts[i],2);
        }
        return Math.sqrt(sum);
    }

    /**
     * 数组行转列
     */
    private static void converRow2Col(){
        for (int i=0;i<allUserMovieCommentList[0].length;i++){
            for(int j=0;j<allUserMovieCommentList.length;j++){
                allMovieCommentList[i][j]=allUserMovieCommentList[j][i];
            }
        }
        System.out.println("课件收藏转行列："+Arrays.deepToString(allMovieCommentList));
    }

    /**
     * 查找用户所在的位置
     * @param user
     * @return
     */
    private static Integer getUserIndex(String user){
        if(user==null || "".contains(user)){
            return null;
        }

        for(int i=0;i<users.length;i++){
            if(user.equals(users[i])){
                return i;
            }
        }

        return null;
    }
}
