package cn.itcast.shop.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.itcast.shop.uservisit.vo.Record;
import cn.itcast.shop.uservisit.vo.Similar;

public class Arithmetic {
	/**
	 * 下面进行相似度计算
	 */
	
	public static  List<Similar> getSimilar(List<Record> l1,List<Record> l2,int distinctUserCount) {
		List<Similar> similarList = new ArrayList<Similar>();
		int j=1;
		int i=0;
		for(j=1;j<=distinctUserCount;j++) {
			int fenzi=0;
			int fenmu1=0;
			int fenmu2=0;
			double fenmu = 0.0 ;
			double res = 0.0; //【以后弄成数组或者集合】
			
			for(i=0;i<l1.size();i++) {
				
				fenzi+=l1.get(i).getCsidvisit()*l2.get((j-1)*l1.size()+i).getCsidvisit();
				
 				fenmu1+=l1.get(i).getCsidvisit()*l1.get(i).getCsidvisit();
				fenmu2+=l2.get((j-1)*l1.size()+i).getCsidvisit()*l2.get((j-1)*l1.size()+i).getCsidvisit();
			}
			fenmu = Math.sqrt(fenmu1)*Math.sqrt(fenmu2);
			if(fenmu==0.0) {
				res = 0.0;
			}else {
				res = fenzi/fenmu;
			}
			//System.out.println("j========"+j);
			//System.out.println(res+"=="+"解决===="+l2.get(j*l1.size()-1).getUid()+"每次点击商品，similar表进行更新");
			Integer refuid = l2.get(j*l1.size()-1).getUid();
			Double similarvalue=res;
			Similar similar = new Similar();
			similar.setUid(l1.get(0).getUid());
			similar.setRefuid(refuid);
			similar.setSimilarvalue(similarvalue);
			System.out.println("用户"+similar.getUid()+"与用户"+similar.getRefuid()+"的相似度为"+similar.getSimilarvalue());
			similarList.add(similar);
		}
		return similarList;
	}
	
	/**
	 * 得到上述similarList的最大值,和第二大的值
	 * @param args
	 */
	
	public static List<Similar> getMaxSimilarValue(List<Similar> list,int topsimilarN) {
		double arrs[] = new double[list.size()];
		for(int i=0;i<list.size();i++) {
			arrs[i] = list.get(i).getSimilarvalue();
		}
		for(int i=0;i<list.size();i++) {
			System.out.print(arrs[i]+"---数组"+"大小为"+arrs.length);
		}
		System.out.println();
		System.out.println("排序后");
		new BubbleSort().fengzhuang(arrs);
		for(int i=0;i<list.size();i++) {
			System.out.print(arrs[i]+"---排序");
		}
		System.out.println();
		//把最大值topsimilarN的数据放入到数据
		double arrMax[] = new double [topsimilarN]; 
		for(int i=0;i<topsimilarN;i++) {
			 arrMax[i] = arrs[arrs.length-1-i];
		}
		System.out.println("最大值的topN相似度的数组为");
		for(int i=0;i<arrMax.length;i++) {
			System.out.print(arrMax[i]+"         ");
		}
		System.out.println();
		
		/**
		 * 判断list<Similar>列表中的similarvalue值包不包含topN的两个数据，返回其索引值或者返回其对象
		 */
		
		for(int i=0;i<list.size();i++) {
			for(int j=0;j<arrMax.length;j++) {
				if(list.get(i).getSimilarvalue()==arrMax[j]) {
					System.out.println("返回包含topN的similarvalue的索引或者list<Similar>"+"============"+i+"refuid为"+list.get(i).getRefuid()+"**************");
				}
			}
		}
		
		List<Similar> topNSimilarList = new ArrayList<Similar>();
		System.out.println();
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getSimilarvalue()==arrs[list.size()-1]||list.get(i).getSimilarvalue()==arrs[list.size()-2]) {
				System.out.println(list.get(i)+"这是相似度最大的两个用户之一"+list.get(i).getRefuid()+"相似度为"+list.get(i).getSimilarvalue());
				topNSimilarList.add(list.get(i));
			}
		}
		return topNSimilarList;
	}
}
