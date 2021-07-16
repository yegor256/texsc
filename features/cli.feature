Feature: Command Line Processing
  As a author of LaTeX document I want to check spelling

  Scenario: Help can be printed
    When I run bin/texsc with "--help"
    Then Exit code is zero
    And Stdout contains "--help"

  Scenario: Good LaTeX can be spell checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, my dear friend?
    \end{document}
    """
    When I run bin/texsc with ""
    Then Exit code is zero
    And Stdout contains "No spelling errors found in 1 file(s)"

  Scenario: Bad LaTeX can be spell checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, my dear friiend?
    \end{document}
    """
    When I run bin/texsc with "--verbose article.tex"
    Then Exit code is not zero
    And Stdout contains "& friiend "

  Scenario: Bad LaTeX with PWS can be spell checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, my dear friiend?
    \end{document}
    """
    And I have a "aspell.en.pws" file with content:
    """
    personal_ws-1.1 en 1 utf-8
    hello
    friiend
    """
    When I run bin/texsc with "--pws aspell.en.pws article.tex"
    Then Exit code is zero

  Scenario: Bad LaTeX with broken PWS can be spell checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, my dear friiend?
    \end{document}
    """
    And I have a "aspell.en.pws" file with content:
    """
    friiend
    """
    When I run bin/texsc with "--pws aspell.en.pws article.tex"
    Then Exit code is not zero
    And Stdout contains "is not in the proper format"

  Scenario: Bad LaTeX with --ignore can be spell checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, my dear \nospell{friiend}?
    \end{document}
    """
    When I run bin/texsc with "--ignore nospell article.tex"
    Then Exit code is zero

  Scenario: Bad LaTeX with complex --ignore can be spell checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, my dear \nospell[friiend]{friiend}{friiend}?
    \end{document}
    """
    When I run bin/texsc with "--ignore nospell:opp article.tex"
    Then Exit code is zero

  Scenario: Bad LaTeX with complex --ignore can be spell checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, \begin{nospell}{test}friiend\end{nospell}?
    \end{document}
    """
    When I run bin/texsc with "--ignore nospell:p article.tex"
    Then Exit code is zero

  Scenario: Bad LaTeX with complex --ignore can be spell checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, \begin{Nospell*}{test}friiend\end{Nospell*}?
    \end{document}
    """
    When I run bin/texsc with "--ignore Nospell*:p article.tex"
    Then Exit code is zero

  Scenario: Bad LaTeX with too short words can be spell checked
    Given I have a "article.tex" file with content:
    """
    \documentclass{article}
    \begin{document}
    How are you, my dear ZZZZ?
    \end{document}
    """
    When I run bin/texsc with "--min-word-length=4 article.tex"
    Then Exit code is zero

