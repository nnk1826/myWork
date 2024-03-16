package Attributes;
import java.util.InputMismatchException;
import java.util.Scanner;
public class Polygon 
{
    protected int m_iMaxSides;
    protected int sides;
    protected int[] length;
    
    public Polygon ()
    {
        m_iMaxSides = 0;
        sides = 0;
        length  = new int[sides];
    }
    
    public Polygon(int sides)
    {
        this.sides = sides;
        length = new int[sides];
    }
    public boolean proofCheck()
    {
        return false;
    }
    public boolean inputInfo(Scanner input)
    {
        boolean bCheck = false;
        try
        {
            System.out.println ("Enter No of sides: ");
            sides = input.nextInt();
            if(sides != m_iMaxSides)
            return false;
        }
        catch (InputMismatchException ex1)
        {
            System.out.println("Invalid input, please enter an integer!");
            input.nextLine();
            return false;
        }
        do
        {
            try
            {
                for(int i = 0; i<sides; i++)
                {
                        System.out.println("Enter the length of " + (i+1) + " line: ");
                        length[i] = input.nextInt();
                } 
                bCheck = proofCheck();
                if(!bCheck)
                    {
                        System.out.println ("That is not a triangle, please re-enter variables! ");
                    }
            }
            catch (InputMismatchException ex)
                {
                    System.out.println("Please enter an integer!");
                    input.nextLine();
                }
        }
        while (bCheck==false);
        return true;
    }
   
    public void showInfo ()
    {
        System.out.println("Length of each line: ");
        for(int i = 0; i<sides; i++)
        {
            System.out.println("Line " + (i+1) + ":" + length[i]);
        }
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
}
