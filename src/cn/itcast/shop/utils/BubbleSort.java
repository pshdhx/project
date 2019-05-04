package cn.itcast.shop.utils;

public class BubbleSort {
	public static void fengzhuang(double[] arr) {
		double temp;//定义一个临时变量
        for(int i=0;i<arr.length-1;i++){//冒泡趟数
            for(int j=0;j<arr.length-i-1;j++){
                if(arr[j+1]<arr[j]){
                    temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
            }
        }
        //System.out.println(Arrays.toString(arr));
	}
}
