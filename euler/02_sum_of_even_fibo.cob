       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUMEVENFIBO.
       AUTHOR. Simon Schliesky.
       DATE-WRITTEN. 02/08/2016.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-UpLim PIC 9(10) VALUE 4000000.
       01 PreviousNo PIC 9(11).
       01 CurrentNo PIC 9(11).
       01 NextNo PIC 9(11).
       01 Result PIC 9(11).
       01 stopCond PIC 9 VALUE ZERO.


       PROCEDURE DIVISION.
      * Purpose: Solve Project Euler task 2
      * https://projecteuler.net/problem=2
       CheckLimitAndRun.
          PERFORM Init.
      *Un/Comment following three lines for timing
      *    DISPLAY "Set upper limit for fibonacci numbers to: ".
      *    ACCEPT WS-UpLim.
      *    DISPLAY WS-UpLim.
          PERFORM CalNosAndSum TEST AFTER UNTIL stopCond=1.
          DISPLAY " Result: "Result.
          STOP RUN.


       CalNosAndSum.
          ADD CurrentNo TO Result.
      *   DISPLAY "Current: " CurrentNo " total " Result.
          COMPUTE NextNo= (4 * CurrentNo) + PreviousNo.
          IF NextNo IS GREATER THAN WS-UpLim THEN
             MOVE 1 to stopCond
          ELSE
             MOVE CurrentNo TO PreviousNo
             MOVE NextNo TO CurrentNo
          END-IF.


       Init.
          MOVE 0 TO PreviousNo.
          MOVE 2 TO CurrentNo.
