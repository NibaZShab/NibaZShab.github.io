package Ai.Main;

import java.util.Scanner;

/**
 * AI核心代码，估值一个亿
 * 人工智能 V1.0
 */

public class AiMain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String str;
        while (true) {
            str = sc.next();
            str = str.replace("吗", "");
            str = str.replace("你","我");
            str = str.replace("?", "!");
            str = str.replace("? ", "! ");
            System.out.println(str);
        }
    }
}
