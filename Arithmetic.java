package Misc;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Scanner;
public class Arithmetic 
{
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
//        System.out.println("Enter numbers of digit in an array: ");
//        int n = input.nextInt();
        int [] arr = new int[]{1,2,4,4,4};
        
//        for (int i=0; i<n; i++)
//        {
//            System.out.printf("num [%d] = ", i+1);
//            arr[i] = input.nextInt();
//        }
        getMissingNumber(arr, 10);
    }

    private static void getMissingNumber(int[] numbers, int length) {
        int missingCount = length - numbers.length;
        BitSet bitSet = new BitSet(length);
        for (int number : numbers) {
            bitSet.set(number - 1);
        }
        int lastMissingIndex = 0;
        System.out.printf("Missing number in integer array %s, with total number %d is: \n", Arrays.toString(numbers), length);
        for (int i = 0; i < missingCount; i++) {
            lastMissingIndex = bitSet.nextClearBit(lastMissingIndex);
            System.out.print(" " + ++lastMissingIndex);
        }
    }
}
