Feature: user submits compound

  The user submits a chemical equation. The program returns the molecular mass

  For the chemical compound the user submits, the program iterates through the equation to return
  the number of atoms. The program multiplies the number of atoms times each specific molecular mass 
  and sums the masses. The program returns the total molecular mass

  Scenario Outline: submit compound
    When I submit "<compound>"
    Then the molecular mass should be "<mass>"

    Scenarios: no matches
      | compound | mass |
      | H2O | 18.01  |
      | O | 15.99 |
      | H2SO4 | 97.99 |
      | NaCl | 58.44 |
      | C6H12O6 | 180.12 |