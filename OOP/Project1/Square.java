package Attributes;

import java.text.DecimalFormat;

public class Square extends Polygon
{
    public Square ()
    {
        m_iMaxSides = 4; 
        sides = 4;
        length  = new int[4];
    }
        
        
    public int perimeter()
    {
        int per = length[0] * 4;
        return per;
    }
    
    public double area()
    {
        double a = length[0] * length[0];
        return a;
    }    
    
    @Override public boolean proofCheck()
    {
        int a = length[0];
        int b = length[1];
        int c = length[2];
        int d = length[3];
        return a == b && b == c && c == d && d == a;
    }
    
    public void display()
    {
        System.out.println(length[0] + ", " + length[1] + ", " + length[2]);
        DecimalFormat df = new DecimalFormat("0.00");     
            System.out.print(df.format(area()));
    }            
}
