       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUMEVENFIBO.
       AUTHOR. Simon Schliesky.
       DATE-WRITTEN. 03/08/2016.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
          SELECT PriceTable
             ASSIGN TO "priceTable.dat"
             ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD PriceTable.
       01 ArticleDetails.
          02 ArticleId      PIC 9(6).
          02 ArticlePrice.
             03 exclVAT     PIC 9(6)V99.
             03 VAT         PIC 9(5)V99.
             03 inclVAT     PIC 9(7)V99.
          02 Availability   PIC X.
             88 isAvailable VALUE 'Y'.
             88 notAvailable VALUE 'N'.

       PROCEDURE DIVISION.
       Main.
          OPEN OUTPUT PriceTable.
          DISPLAY "Enter articles below. Enter on an empty line ends.".
          PERFORM GetInput.
          PERFORM UNTIL ArticleId = ZERO
             WRITE ArticleDetails
             PERFORM GetInput
          END-PERFORM.
          CLOSE PriceTable.
          STOP RUN.
       GetInput.
          DISPLAY "Enter - ArticleId".
          ACCEPT ArticleId
          DISPLAY "Enter - Article price (excl. VAT)".
          ACCEPT exclVAT.
          MULTIPLY exclVAT by 0.19 GIVING VAT.
          ADD exclVAT TO VAT GIVING inclVAT.
          DISPLAY "Enter - Availability (Y/N)".
          ACCEPT Availability.
