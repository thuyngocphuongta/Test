# Programmieren mit statistischer Software: Hausarbeit - Teil 1

## How to work with the Assignment:
1. Make sure you have all relevant packages installed:
```r
install.packages("tidyverse")
install.packages("forcats")
install.packages("nycflights13")
```

1. If not installed, install **git** (https://git-scm.com/downloads). Afterwards restart RStudio.

1. Download the Assignment Repository:
  `RStudio -> File -> New Project ->  Version Control -> git`
  Copy the URL for your assignment into the field **Repository URL**
  If you encounter problems, see the [Guide](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN)

1. If you are using RStudio open R-Project using the file: `test_assignment_***.Rproj` in the folder.
   You can either load all required packages using calls to `library()` or by running 
   `devtools::load_all()`. This loads all required packages.

1. Solve the different exercises in the respective files inside the **R** folder!
    -  **Only create the required functions. No calls to library/installing packages outside of the functions.**
    - Only code contained in the **R/Exercise_1-3.R** will be graded.

1. After you have finished, add the files to git, commit them and when you are ready push them to GitHub.

    Note: 
    Our approach relies on automatically checking your solutions for technical validity.
    We use the concept of [Unit Tests](http://r-pkgs.had.co.nz/tests.html) together with 
    [Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration) to automatically check your code. 
    This gives you the opportunity to get instant feedback, and see which functions are correct and which not.

    More Info: [Checks](http://r-pkgs.had.co.nz/check.html) and 
               [Travis](https://towardsdatascience.com/travis-ci-for-r-advanced-guide-719cb2d9e0e5).

1. A few minutes after pushing to Github, Travis-CI checks should run!
     You can observe the results on the Github page of your repository on   
     Github: `commits -> green checkmark` (See screenshots).

    ![Commit](inst/commits.jpg)

    ![Checkmark](inst/success.png)
    
    You can push a new version to Github multiple times. The checks are then run again for every commit!

   
1. **Tests for each function are activated as soon as you defined the function.
     If you want to run tests only for a single function, temporarily uncomment all other functions!**

1. If you have successfully created all functions and the green checkmark appears, our tests successfully passed for each function!




## Build and check locally:

If you do not want to wait for Travis checks, you can build the package locally:
This also gives more verbose information into which checks run and which do not.

1. Install a few more packages:
```r
install.packages("devtools")
install.packages("checkmate")
install.packages("testthat")
```

1. If you are using RStudio open R-Project file: `test_assignment****.Rproj` in the folder.

1. Use `devtools::test()` and `devtools::check()`!

## Troubleshooting:

1. If building and checking locally does not work out of the box, you might have to install R-Tools (https://cran.r-project.org/bin/windows/Rtools/).

1. For an in-depth view, consider the Datacamp Course [Developing R Packages](https://www.datacamp.com/courses/developing-r-packages)



