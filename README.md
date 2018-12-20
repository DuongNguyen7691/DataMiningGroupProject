
The goal of the project is to design and implement two  bivariate, 
spatial outlier detection techniques of your own preference—each student develops a different one. 
You will apply the technique of your choice to the 2-dimensional dataset called Complex8_RN15 ,
is the variation of the Complex8 dataset with 15% gaussian noise added to the original Complex8 dataset. 
Finally, you will compare the results with those of your team mate and write a summary report. 
Your outlier detection techniques should take the dataset and create a copy of the dataset that
contains an additional column/attribute called ols (“outlier score”) which contains numbers that 
indicates how much your outlier detection method believes that the particular object is an outlier if 
the smaller the value of the ols attribute the less likely the object is believed to be an outlier. 
For the project, you can use any R-library or any other software library to accomplish the project tasks; 
just acknowledge what external software you used in your project report. 



Assignment Tasks:


Task 1: Visualize the Complex8_RN15 dataset; visualize the third attribute using different colors, like supervised scatterplots we used in Assignments 1/2. 3 pts

Task 2: Design and implement 2 outlier detection techniques—one per student—for the Complex8_RN15 dataset. 10 pts (5 for each technique)
As explained earlier your implementation should add a column/attribute ols to the dataset and fill this column with numbers. 

Task 3: Evaluation (one for each technique)
  a. Apply our outlier detection to the Complex8_RN15 dataset obtaining a new file X; your outlier detection method is only applied to attributes x and y of the dataset, and ignores the attribute named class and adds an ols-column to the dataset. 3 pts
 
   b. Sort X in descending order based on the values of attribute ols (the example with the highest ols value/the example that is the most likely outlier should be the first entry in X)! 3 pts
    
    c. Visualize the first 7% of the observations in X, just displaying their x and y value and the class using a different color for each class, in a display and the remaining 93% of the observations in a second display. In general, the first display visualizes the outliers and the second display visualizes the normal observations in the dataset. 3 pts
  
  d. Visualize the first 14% of the observations in X, just displaying the x and y value and the class using a different color for each class and the remaining 86% of the observations in a second display.  3 pts
  
  e. Visualize the first 21% of the observations in X, just displaying the x and y value and class using a different color for each class, in a display and the remaining 79% of the observations in a second display. 3 pts
  
  f. Interpret the 6 displays you generated in steps c-e; particularly, assess how well does your outlier detection method work—intuitively observations that are quite far a way of the 8 natural clusters of the original Complex8 dataset should be outliers. Also try to characterize which points are picked as outliers as the first 7%, 14%, and 21%, respectively 9 pts
  
  g. Create a histogram for the ols values of the top 21% entries in file X. Briefly, interpret the obtained histogram! 5 pts

Task 4: Write 2-5 paragraphs (for each technique), explaining each outlier detection technique works and how it was implemented. 
        If you enhanced your approach based on feedback to get better results also describe how you enhanced your technique. 
        If your outlier detection technique needs the selection of parameter values before it can be run,
          describe how you selected those parameter values. Moreover, mention in an additional paragraph what (if any) 
          external software packages your used in the project! 10 pts

Task 5: Compare the two outlier detection techniques you developed in 2-4 paragraphs. 
        Try to assess which technique worked better. Finally, write 1-2 paragraphs, 
        describing what you leant from the project and if you enjoyed it or not. 
        A significant amount of points will be allocated to this comparison; therefore, try to do a good job in comparing and evaluating your two techniques. 15 pts.
