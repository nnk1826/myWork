package Misc;
import java.util.*;
import java.util.Scanner;
public class findSubsequentString {
    // Declare a global list
    static List<String> mem = new ArrayList<>();
 
    // Creating a public static Arraylist such that
    // we can store values
    // IF there is any question of returning the
    // we can directly return too// public static
    // ArrayList<String> al = new ArrayList<String>();
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in); 
        System.out.println("Enter string");
        String s = input.nextLine();
        findsubsequences(s, ""); // Calling a function
        System.out.println(mem);
    }
 
    private static void findsubsequences(String s,String ans)
    {
        if (s.length() == 0) {
            mem.add(ans);
            return;
        }
 
        // We add adding 1st character in string
        findsubsequences(s.substring(1), ans + s.charAt(0));
 
        // Not adding first character of the string
        // because the concept of subsequence either
        // character will present or not
        findsubsequences(s.substring(1), ans);
    }
}
//    {
//       int[] arr;
//		arr = new int[5];
//		arr[0] = 10;
//		arr[1] = 20;    
//		arr[2] = 30;
//		arr[3] = 40;
//		arr[4] = 50;
//		for (int i = 0; i < arr.length; i++)
//			System.out.println("Element at index " + i + " : " + arr[i]);
//    }
//}


    //class Student {
    //	public int roll_no;
    //	public String name;
    //	Student(int roll_no, String name)
    //	{
    //		this.roll_no = roll_no;
    //		this.name = name;
    //	}
    //}
    //
    //// Elements of the array are objects of a class Student.
    //public class Project3 {
    //	public static void main(String[] args)
    //	{
    //		Student[] arr;
    //		arr = new Student[5];
    //		arr[0] = new Student(10, "aman");
    //		arr[1] = new Student(2, "vaibhav");
    //		arr[2] = new Student(3, "shikar");
    //		arr[3] = new Student(4, "dharmesh");
    //		arr[4] = new Student(5, "mohit");
    //
    //		for (int i = 0; i < arr.length; i++)
    //			System.out.println("Element at " + i + " : "
    //							+ arr[i].roll_no + " "
    //							+ arr[i].name);
    //	}
    //}

