package com.GabeGame;

public class Main {

    public static void main(String[] args) {
        boolean gameOver = true;
        int score = 800;
        int levelCompleted = 5;
        int bonus = 100;

        calculateScore(gameOver, score, levelCompleted, bonus);

        score = 1000;
        levelCompleted = 8;
        bonus = 200;

        calculateScore(gameOver, score, levelCompleted, bonus);
    }

    public static void calculateScore(boolean gameOver, int score, int levelCompleted, int bonus) {
        if(gameOver) {
            System.out.println(score + (levelCompleted * bonus) + 1000);
        }
    }
}
