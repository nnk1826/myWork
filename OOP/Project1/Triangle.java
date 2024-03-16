package Attributes;

import java.text.DecimalFormat;

public class Triangle extends Polygon 
{
  
    public Triangle ()
    {
        m_iMaxSides = 3; 
        sides = 3;
        length  = new int[3];
    }
    
    
    public int perimeter()
    {
        int per = 0;
         for(int i = 0; i<sides; i++)
        {
            per += length[i];
        }
        return per;
    }
    
    public double area()
    {
        double p = perimeter()/2;
         return Math.sqrt(p*(p-length[0])*(p-length[1])*(p-length[2]));
    }    
    
    @Override public boolean proofCheck()
    {
        int a = length[0];
        int b = length[1];
        int c = length[2];
        if ((a+b>c) && (b+c>a) && (c+a>b) && a!=0 && b!=0 && c!=0)
        {
            return true;
        } else
        {
            if ((a+b-1) == (a-b+1) || (a+b-1) == (b-a+1))  
            {
                System.out.println("Zero suggestion");
                return false;
            }
            if ((a-b)>(b-a))
            {
                System.out.println("Suggested number range for last number: " + (a+b-1) + " - " + (a-b+1));
            } else
            {
                System.out.println("Suggested number range for last number : " + (a+b-1) + " - " + (b-a+1));
            }           
        }
        return false;
    }
    
    public void display()
    {
        System.out.println(length[0] + ", " + length[1] + ", " + length[2]);
        DecimalFormat df = new DecimalFormat("0.00");     
        System.out.print(df.format(area()));
    }
}
