package runInstructions;

import java.util.ArrayList;
import java.util.Scanner;
import Attributes.Triangle;
import java.util.InputMismatchException;

public class Implement {
    private ArrayList<Triangle> lt;
    
    public Implement()
    {
        lt = new ArrayList<Triangle>(10);
    }
    
    public void addTriangle(Triangle t)
    {
        lt.add(t);
    }
    
    public boolean inputList(Scanner input)
    {
        Triangle t;
        boolean bLoop = false;
        int n;
        while (true)
        {
            try
            {
                System.out.println("Please enter number(s) of triangle(s): ");
                n = input.nextInt();
            }
            catch (InputMismatchException ex)
            {
                System.out.println("Invalid input, please enter an integer!");
                input.nextLine();
                continue;
            }
            for (int i=0; i<n; i++)
            {
                System.out.println("triangle no " +(i+1)+ ":");
                t = new Triangle();
                do
                {   
                    bLoop = t.inputInfo(input);
                    if(bLoop)
                    {
                        addTriangle(t);
                    }           
                }
                while(bLoop == false);
            }
            return true;
        }   
    }
    public void maxTriangle()
    {
        double max = lt.get(0).area();
        for (int i=1; i<lt.size(); i++)
        {
            if (max < lt.get(i).area())
            {
                max=lt.get(i).area();
            }
        }
        for (Triangle triangle : lt)
        {
            if (max == triangle.area())
            {
                triangle.display();
            }
        }
    }
    
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        Implement aaa = new Implement();
        aaa.inputList(input);
        System.out.println("Max triangle: ");
        aaa.maxTriangle();
        input.close();
    }
}

