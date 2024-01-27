library(stargazer)
library(moments)
library(rio)
library(dplyr)
library(tidyr)
library("car")
library(writexl)

#importing Data from year 2015 - 2020
bike15 = import("C:/study/SDM/Project data/NSDUH_2015.RData")
colnames(bike15) = tolower(make.names(colnames(bike15)))
bike16 = import("C:/study/SDM/Project data/NSDUH_2016.RData")
colnames(bike16) = tolower(make.names(colnames(bike16)))
bike17 = import("C:/study/SDM/Project data/NSDUH_2017.RData")
colnames(bike17) = tolower(make.names(colnames(bike17)))
bike18 = import("C:/study/SDM/Project data/NSDUH_2018.RData")
colnames(bike18) = tolower(make.names(colnames(bike18)))
bike19 = import("C:/study/SDM/Project data/NSDUH_2019.RData")
colnames(bike19) = tolower(make.names(colnames(bike19)))
bike20 = import("C:/study/SDM/Project data/NSDUH_2020.RData")
colnames(bike20) = tolower(make.names(colnames(bike20)))
names(bike15)[names(bike15) == "edugrdnow2"] < -"eduschgrd2"
#merging the data from all years to single data frame
cc1 < -intersect(names(bike15), names(bike16))
cc2 < -intersect(names(bike17), names(bike18))
cc3 < -intersect(names(bike19), names(bike20))
cc < -intersect(cc1, cc2)
cc < -intersect(cc, cc3)
merge_df < -rbind(bike15[, cc], bike16[, cc], bike17[, cc], bike18[, cc], bike19[, cc], bike20[, cc])

#subsetting data of individuals having PHQ9 score > 0
for analysis
merge_df1 < -merge_df[merge_df$phq0 != 0, ]
main_merge_df1 = merge_df1

#data cleaning and engineering the variables
for each drugs

#cigerettes
main_merge_df1$cg30est = ifelse((main_merge_df1$cg30est == 91 | main_merge_df1$cg30est == 93 | main_merge_df1$cg30est == 94 | main_merge_df1$cg30est == 97 | main_merge_df1$cg30est == 98 | main_merge_df1$cg30est == 99), 0, main_merge_df1$cg30est)
main_merge_df1$cg30est = as.factor(main_merge_df1$cg30est)
table(main_merge_df1$cg30est)
main_merge_df1$ci30est = ifelse((main_merge_df1$ci30est == 91 | main_merge_df1$ci30est == 93 | main_merge_df1$ci30est == 94 | main_merge_df1$ci30est == 97 | main_merge_df1$ci30est == 98 | main_merge_df1$ci30est == 99), 0, main_merge_df1$ci30est)
main_merge_df1$cigever = as.factor(main_merge_df1$cigever)
table(main_merge_df1$cigever)
main_merge_df1$cigever = relevel(main_merge_df1$cigever, ref = 2)

#alchohol
main_merge_df1$alcever = ifelse(main_merge_df1$alcever == 1, 1, ifelse(main_merge_df1$alcever == 2, 2, 0))
main_merge_df1$alcrec = ifelse((main_merge_df1$alcrec == 1 | main_merge_df1$alcrec == 11), 1, ifelse((main_merge_df1$alcrec == 2 | main_merge_df1$alcrec == 8), 2, ifelse((main_merge_df1$alcrec == 3 | main_merge_df1$alcrec == 9), 3, 0)))
table(main_merge_df1$alcrec)
main_merge_df1$alcyrtot = ifelse(main_merge_df1$alcyrtot > 365, 0, main_merge_df1$alcyrtot)
table(main_merge_df1$alcyrtot)
main_merge_df1$aldaypmo = ifelse(main_merge_df1$aldaypmo > 31, 0, main_merge_df1$aldaypmo)
table(main_merge_df1$aldaypmo)
main_merge_df1$aldaypwk = ifelse(main_merge_df1$aldaypwk > 7, 0, main_merge_df1$aldaypwk)
table(main_merge_df1$aldaypwk)
main_merge_df1$alcdays = ifelse(main_merge_df1$alcdays > 30, 0, main_merge_df1$alcdays)
table(main_merge_df1$alcdays)
main_merge_df1$alcus30d = ifelse(main_merge_df1$alcus30d > 85, 0, main_merge_df1$alcus30d)
table(main_merge_df1$alcus30d)
main_merge_df1$alcever = as.factor(main_merge_df1$alcever)
main_merge_df1$alcrec = as.factor(main_merge_df1$alcrec)

#mariauna
main_merge_df1$mjever = ifelse(main_merge_df1$mjever == 1, 1, ifelse(main_merge_df1$mjever == 2, 2, 0))
table(main_merge_df1$mjever)
table(main_merge_df1$mjrec)
table(main_merge_df1$alcyrtot)
table(main_merge_df1$aldaypmo)
main_merge_df1$mjrec = ifelse((main_merge_df1$mjrec == 1 | main_merge_df1$mjrec == 11), 1, ifelse((main_merge_df1$mjrec == 2 | main_merge_df1$mjrec == 8), 2, ifelse((main_merge_df1$mjrec == 3 | main_merge_df1$mjrec == 9), 3, 0)))
table(main_merge_df1$alcrec)
main_merge_df1$mjyrtot = ifelse(main_merge_df1$mjyrtot > 365, 0, main_merge_df1$mjyrtot)
table(main_merge_df1$alcyrtot)
main_merge_df1$mrdaypmo = ifelse(main_merge_df1$mrdaypmo > 31, 0, main_merge_df1$mrdaypmo)
table(main_merge_df1$aldaypmo)
main_merge_df1$mrdaypwk = ifelse(main_merge_df1$mrdaypwk > 7, 0, main_merge_df1$mrdaypwk)
table(main_merge_df1$aldaypwk)
main_merge_df1$alcdays = ifelse(main_merge_df1$alcdays > 30, 0, main_merge_df1$alcdays)
table(main_merge_df1$alcdays)
main_merge_df1$mjday30a = ifelse(main_merge_df1$mjday30a > 30, 0, main_merge_df1$mjday30a)
table(main_merge_df1$alcus30d)
main_merge_df1$mjever = as.factor(main_merge_df1$mjever)
main_merge_df1$alcever = as.factor(main_merge_df1$mjrec)

#cocaine
main_merge_df1$cocever = ifelse(main_merge_df1$cocever == 1, 1, ifelse(main_merge_df1$cocever == 2, 2, 0))
table(main_merge_df1$cocever)
table(main_merge_df1$mjrec)
table(main_merge_df1$alcyrtot)
table(main_merge_df1$aldaypmo)
main_merge_df1$cocrec = ifelse((main_merge_df1$cocrec == 1 | main_merge_df1$cocrec == 11), 1, ifelse((main_merge_df1$cocrec == 2 | main_merge_df1$cocrec == 8), 2, ifelse((main_merge_df1$cocrec == 3 | main_merge_df1$cocrec == 9), 3, 0)))
table(main_merge_df1$cocrec)
main_merge_df1$cocyrtot = ifelse(main_merge_df1$cocyrtot > 365, 0, main_merge_df1$cocyrtot)
table(main_merge_df1$cocyrtot)
main_merge_df1$ccdaypmo = ifelse(main_merge_df1$ccdaypmo > 31, 0, main_merge_df1$ccdaypmo)
table(main_merge_df1$ccdaypmo)
main_merge_df1$ccdaypwk = ifelse(main_merge_df1$ccdaypwk > 7, 0, main_merge_df1$ccdaypwk)
table(main_merge_df1$ccdaypwk)
main_merge_df1$cocus30a = ifelse(main_merge_df1$cocus30a > 30, 0, main_merge_df1$cocus30a)
table(main_merge_df1$cocus30a)

main_merge_df1$cocever = as.factor(main_merge_df1$cocever)
main_merge_df1$cocrec = as.factor(main_merge_df1$cocrec)

#crack
main_merge_df1$crkever = ifelse(main_merge_df1$crkever == 1, 1, ifelse(main_merge_df1$crkever == 2, 2, 0))
table(main_merge_df1$crkever)
table(main_merge_df1$mjrec)
table(main_merge_df1$alcyrtot)
table(main_merge_df1$aldaypmo)
main_merge_df1$crakrec = ifelse((main_merge_df1$crakrec == 1 | main_merge_df1$crakrec == 11), 1, ifelse((main_merge_df1$crakrec == 2 | main_merge_df1$crakrec == 8), 2, ifelse((main_merge_df1$crakrec == 3 | main_merge_df1$crakrec == 9), 3, 0)))
table(main_merge_df1$crakrec)
main_merge_df1$crkyrtot = ifelse(main_merge_df1$crkyrtot > 365, 0, main_merge_df1$crkyrtot)
table(main_merge_df1$crkyrtot)
main_merge_df1$crdaypmo = ifelse(main_merge_df1$crdaypmo > 31, 0, main_merge_df1$crdaypmo)
table(main_merge_df1$ccdaypmo)
main_merge_df1$crdaypwk = ifelse(main_merge_df1$crdaypwk > 7, 0, main_merge_df1$crdaypwk)
table(main_merge_df1$ccdaypwk)
main_merge_df1$cocus30a = ifelse(main_merge_df1$cocus30a > 30, 0, main_merge_df1$cocus30a)
table(main_merge_df1$cocus30a)
main_merge_df1$cocever = as.factor(main_merge_df1$cocever)
main_merge_df1$crkever = as.factor(main_merge_df1$crkever)

#heroin
main_merge_df1$herever = ifelse(main_merge_df1$herever == 1, 1, ifelse(main_merge_df1$herever == 2, 2, 0))
table(main_merge_df1$crkever)
table(main_merge_df1$mjrec)
table(main_merge_df1$alcyrtot)
table(main_merge_df1$aldaypmo)
main_merge_df1$herrec = ifelse((main_merge_df1$herrec == 1 | main_merge_df1$herrec == 11), 1, ifelse((main_merge_df1$herrec == 2 | main_merge_df1$herrec == 8), 2, ifelse((main_merge_df1$herrec == 3 | main_merge_df1$herrec == 9), 3, 0)))
table(main_merge_df1$herrec)
main_merge_df1$heryrtot = ifelse(main_merge_df1$heryrtot > 365, 0, main_merge_df1$heryrtot)
table(main_merge_df1$crkyrtot)
main_merge_df1$hrdaypmo = ifelse(main_merge_df1$hrdaypmo > 31, 0, main_merge_df1$hrdaypmo)
table(main_merge_df1$ccdaypmo)
main_merge_df1$hrdaypwk = ifelse(main_merge_df1$hrdaypwk > 7, 0, main_merge_df1$hrdaypwk)
table(main_merge_df1$ccdaypwk)
main_merge_df1$her30use = ifelse(main_merge_df1$her30use > 30, 0, main_merge_df1$her30use)
table(main_merge_df1$cocus30a)
main_merge_df1$herever = as.factor(main_merge_df1$herever)
main_merge_df1$herrec = as.factor(main_merge_df1$herrec)

#inhalants
main_merge_df1$inhalever = ifelse(main_merge_df1$inhalever == 1, 1, ifelse(main_merge_df1$inhalever == 2, 2, 0))
table(main_merge_df1$crkever)
table(main_merge_df1$mjrec)
table(main_merge_df1$alcyrtot)
table(main_merge_df1$aldaypmo)
main_merge_df1$inhalrec = ifelse((main_merge_df1$inhalrec == 1 | main_merge_df1$inhalrec == 11), 1, ifelse((main_merge_df1$inhalrec == 2 | main_merge_df1$inhalrec == 8), 2, ifelse((main_merge_df1$inhalrec == 3 | main_merge_df1$inhalrec == 9), 3, 0)))
table(main_merge_df1$herrec)
main_merge_df1$heryrtot = ifelse(main_merge_df1$heryrtot > 365, 0, main_merge_df1$heryrtot)
table(main_merge_df1$crkyrtot)
main_merge_df1$inhdypmo = ifelse(main_merge_df1$inhdypmo > 31, 0, main_merge_df1$inhdypmo)
table(main_merge_df1$ccdaypmo)
main_merge_df1$inhdypwk = ifelse(main_merge_df1$inhdypwk > 7, 0, main_merge_df1$inhdypwk)
table(main_merge_df1$ccdaypwk)

# no variable in weed
main_merge_df1$inhal30n = ifelse(main_merge_df1$inhal30n > 30, 0, main_merge_df1$inhal30n)
table(main_merge_df1$cocus30a)
main_merge_df1$inhalever = as.factor(main_merge_df1$inhalever)
main_merge_df1$inhalrec = as.factor(main_merge_df1$inhalrec)

#Pain relievers
main_merge_df1$pnrnmlif = ifelse(main_merge_df1$pnrnmlif == 1, 1, ifelse(main_merge_df1$pnrnmlif == 2, 2, 0))
table(main_merge_df1$crkever)
table(main_merge_df1$mjrec)
table(main_merge_df1$alcyrtot)
table(main_merge_df1$aldaypmo)
main_merge_df1$oxycnanyyr = ifelse(main_merge_df1$oxycnanyyr == 1, 1, ifelse(main_merge_df1$oxycnanyyr == 2, 2, 0))
main_merge_df1$pnranyrec = ifelse(main_merge_df1$pnranyrec == 1, 1, ifelse(main_merge_df1$pnranyrec == 2 | main_merge_df1$pnranyrec == 9, 2, 0))
main_merge_df1$pnrnmlif = as.factor(main_merge_df1$pnrnmlif)
main_merge_df1$oxycnanyyr = as.factor(main_merge_df1$oxycnanyyr)
main_merge_df1$pnranyrec = as.factor(main_merge_df1$pnranyrec)

#tranqulizers
main_merge_df1$trqanylif = ifelse(main_merge_df1$trqanylif == 1, 1, ifelse(main_merge_df1$trqanylif == 2, 2, 0))
main_merge_df1$trqanylif = as.factor(main_merge_df1$trqanylif)

#stumulants
main_merge_df1$stmanylif = ifelse(main_merge_df1$stmanylif == 1, 1, ifelse(main_merge_df1$stmanylif == 2, 2, 0))
main_merge_df1$stmnmrec = ifelse((main_merge_df1$stmnmrec == 1 | main_merge_df1$stmnmrec == 11), 1, ifelse((main_merge_df1$stmnmrec == 2 | main_merge_df1$stmnmrec == 8), 2, ifelse((main_merge_df1$stmnmrec == 3 | main_merge_df1$stmnmrec == 9), 3, 0)))
main_merge_df1$stmnm30fq = ifelse(main_merge_df1$stmnm30fq > 31, 0, main_merge_df1$stmnm30fq)
main_merge_df1$stmanylif = as.factor(main_merge_df1$stmanylif)

main_merge_df1$stmnmrec = as.factor(main_merge_df1$stmnmrec)

#sedatives
main_merge_df1$sednmlif = ifelse(main_merge_df1$sednmlif == 1, 1, ifelse(main_merge_df1$sednmlif == 2, 2, 0))
main_merge_df1$sednmrec = ifelse((main_merge_df1$sednmrec == 1 | main_merge_df1$sednmrec == 11), 1, ifelse((main_merge_df1$sednmrec == 2 | main_merge_df1$sednmrec == 8), 2, ifelse((main_merge_df1$sednmrec == 3 | main_merge_df1$sednmrec == 9), 3, 0)))
main_merge_df1$sednm30fq = ifelse(main_merge_df1$sednm30fq > 30, 0, main_merge_df1$sednm30fq)
main_merge_df1$sednmlif = as.factor(main_merge_df1$sednmlif)
main_merge_df1$sednmrec = as.factor(main_merge_df1$sednmrec)

#Meth
main_merge_df1$methamevr = ifelse(main_merge_df1$methamevr == 1, 1, ifelse(main_merge_df1$methamevr == 2, 2, 0))
main_merge_df1$methamrec = ifelse((main_merge_df1$methamrec == 1 | main_merge_df1$methamrec == 11), 1, ifelse((main_merge_df1$methamrec == 2 | main_merge_df1$methamrec == 8), 2, ifelse((main_merge_df1$methamrec == 3 | main_merge_df1$methamrec == 9), 3, 0)))
main_merge_df1$methdysyr = ifelse(main_merge_df1$methdysyr > 365, 0, main_merge_df1$methdysyr)
main_merge_df1$methdypmo = ifelse(main_merge_df1$methdypmo > 31, 0, main_merge_df1$methdypmo)
main_merge_df1$methdypwk = ifelse(main_merge_df1$methdypwk > 7, 0, main_merge_df1$methdypwk)
main_merge_df1$methamyfq = ifelse(main_merge_df1$methamyfq > 365, 0, main_merge_df1$methamyfq)
main_merge_df1$metham30n = ifelse(main_merge_df1$metham30n > 30, 0, main_merge_df1$metham30n)
main_merge_df1$methamevr = as.factor(main_merge_df1$methamevr)
main_merge_df1$methamrec = as.factor(main_merge_df1$methamrec)

#Special Drugs
main_merge_df1$ghb = ifelse(main_merge_df1$ghb == 1, 1, ifelse(main_merge_df1$ghb == 2, 2, 0))
main_merge_df1$ghbrec = ifelse((main_merge_df1$ghbrec == 1 | main_merge_df1$ghbrec == 11), 1, ifelse((main_merge_df1$ghbrec == 2 | main_merge_df1$ghbrec == 8), 2, ifelse((main_merge_df1$ghbrec == 3 | main_merge_df1$ghbrec == 9), 3, 0)))
main_merge_df1$ghb = as.factor(main_merge_df1$ghb)
main_merge_df1$ghbrec = as.factor(main_merge_df1$ghbrec)

#blunts
main_merge_df1$blntever =
  ifelse(main_merge_df1$blntever == 1 | main_merge_df1$blntever == 11, 1, ifelse(main_merge_df1$blntever == 2 | main_merge_df1$blntever == 4, 2, 0))
main_merge_df1$blntrec = ifelse((main_merge_df1$blntrec == 1 | main_merge_df1$blntrec == 11), 1, ifelse((main_merge_df1$blntrec == 2 | main_merge_df1$blntrec == 8), 2, ifelse((main_merge_df1$blntrec == 3 | main_merge_df1$blntrec == 9), 3, 0)))
main_merge_df1$blnt30dy = ifelse(main_merge_df1$blnt30dy > 30, 0, main_merge_df1$blnt30dy)
main_merge_df1$blntever = as.factor(main_merge_df1$blntever)
main_merge_df1$blntrec = as.factor(main_merge_df1$blntrec)

#special topics

main_merge_df1$booked = ifelse(main_merge_df1$booked == 1 | main_merge_df1$booked == 3, 1, ifelse(main_merge_df1$booked == 2, 2, 0))
main_merge_df1$nobooky2 = ifelse(main_merge_df1$nobooky2 > 4, 0, main_merge_df1$nobooky2)
main_merge_df1$booked = as.factor(main_merge_df1$booked)
main_merge_df1$nobooky2 = as.factor(main_merge_df1$nobooky2)

#drug treatment
main_merge_df1$txevrrcvd = ifelse(main_merge_df1$txevrrcvd > 2, 0, main_merge_df1$txevrrcvd)
main_merge_df1$txyrrecvd = ifelse((main_merge_df1$txyrrecvd == 1 | main_merge_df1$txyrrecvd == 3), 1, ifelse((main_merge_df1$txyrrecvd == 2 | main_merge_df1$txyrrecvd == 4 | main_merge_df1$txyrrecvd == 99), 2, 0))
main_merge_df1$txyraldgb = ifelse(main_merge_df1$txyraldgb == 99, 'No Treatment', ifelse((main_merge_df1$txyraldgb == 1 | main_merge_df1$txyraldgb == 4 | main_merge_df1$txyraldgb == 11), 'Treatment For Alcohol only', ifelse((main_merge_df1$txyraldgb == 2 | main_merge_df1$txyraldgb == 12), 'Treatment for Drug use only',
  ifelse((main_merge_df1$txyraldgb == 3 | main_merge_df1$txyraldgb == 6), 'Treatment for Both alchohol and Drug Use', 'Othercases'))))
main_merge_df1$txyrrecvd = as.factor(main_merge_df1$txyrrecvd) main_merge_df1$txyraldgb = as.factor(main_merge_df1$txyraldgb)

#health

main_merge_df1$pregnant = ifelse(main_merge_df1$pregnant == 1, 1, ifelse(main_merge_df1$pregnant == 2, 2, 0))
main_merge_df1$pregnant = as.factor(main_merge_df1$pregnant)
#mental health
main_merge_df1$dstnrv30 = ifelse((main_merge_df1$dstnrv30 == 1), 'All of the time', ifelse((main_merge_df1$dstnrv30 == 2), 'Most of The Time', ifelse((main_merge_df1$dstnrv30 == 3), 'Some of the Time', ifelse(main_merge_df1$dstnrv30 == 4, 'Little of the time', ifelse(main_merge_df1$dstnrv30 == 5, 'None of The Time', 'Other')))))
main_merge_df1$dsthop30 = ifelse((main_merge_df1$dsthop30 == 1), 'All of the time', ifelse((main_merge_df1$dsthop30 == 2), 'Most of The Time',
  ifelse((main_merge_df1$dsthop30 == 3), 'Some of the Time', ifelse(main_merge_df1$dsthop30 == 4, 'Little of the time', ifelse(main_merge_df1$dsthop30 == 5, 'None of The Time', 'Other')))))
main_merge_df1$dstrst30 = ifelse((main_merge_df1$dstrst30 == 1), 'All of the time', ifelse((main_merge_df1$dstrst30 == 2), 'Most of The Time',
  ifelse((main_merge_df1$dstrst30 == 3), 'Some of the Time', ifelse(main_merge_df1$dstrst30 == 4, 'Little of the time', ifelse(main_merge_df1$dstrst30 == 5, 'None of The Time', 'Other')))))
main_merge_df1$dstnrv30 = as.factor(main_merge_df1$dstnrv30)
main_merge_df1$dsthop30 = as.factor(main_merge_df1$dsthop30)
main_merge_df1$dstrst30 = as.factor(main_merge_df1$dstrst30)

#demographics

main_merge_df1$age_catagory = ifelse((main_merge_df1$catag6 == 1), '12-17 years', ifelse((main_merge_df1$catag6 == 2), '18 - 25 years',
  ifelse((main_merge_df1$catag6 == 3), '26 to 34 years', ifelse(main_merge_df1$catag6 == 4, '35 - 49 years', ifelse(main_merge_df1$catag6 == 5, '50 - 64 years', '65 years or older')))))
main_merge_df1$health_category = ifelse((main_merge_df1$health == 1), 'Excellent', ifelse((main_merge_df1$catag6 == 2), 'Very Good',
  ifelse((main_merge_df1$catag6 == 3), 'Good', ifelse(main_merge_df1$catag6 == 4, 'Fair', ifelse(main_merge_df1$catag6 == 5, 'Poor', 'Bad data')))))
main_merge_df1$education_category = ifelse((main_merge_df1$eduschgrd2 == 1), '5th grade or lower', ifelse((main_merge_df1$eduschgrd2 == 2), '6th grade', ifelse((main_merge_df1$eduschgrd2 == 3), '7th grade',
  ifelse((main_merge_df1$eduschgrd2 == 4), '8th grade', ifelse((main_merge_df1$eduschgrd2 == 5), '9th grade', ifelse((main_merge_df1$eduschgrd2 == 6), '10th grade',

    ifelse((main_merge_df1$eduschgrd2 == 7), '11th grade', ifelse((main_merge_df1$eduschgrd2 == 8), '12th grade', ifelse((main_merge_df1$eduschgrd2 == 9), 'college or university/1st year', ifelse((main_merge_df1$eduschgrd2 == 10), 'college or university/2nd year, 3rd year', ifelse((main_merge_df1$eduschgrd2 == 11), 'college or university/4th year, 5th year or higher year', 'Bad data')))))))))))
main_merge_df1$age_catagory = as.factor(main_merge_df1$age_catagory)
main_merge_df1$health_category = as.factor(main_merge_df1$health_category)
main_merge_df1$education_category = as.factor(main_merge_df1$education_category)
#for 2015, education to edugrdnow2 to eduschgrd2-- -- -- -
main_merge_df1$coutyp4 = ifelse(main_merge_df1$coutyp4 == 1, 'Large Metro', ifelse(main_merge_df1$coutyp4 == 2, 'Small Metro', 'Non Metro'))
main_merge_df1$coutyp4 = as.factor(main_merge_df1$coutyp4)

#cigerette
main_merge_df1$ircigfm = ifelse((main_merge_df1$ircigfm == 91 | main_merge_df1$ircigfm == 93), 0, main_merge_df1$ircigfm)
main_merge_df1$ircigrc = ifelse(main_merge_df1$ircigrc == 1, 'With in 30 days', ifelse(main_merge_df1$ircigrc == 2, 'More than 30 days but with in 1 Year', ifelse(main_merge_df1$ircigrc == 3, 'More than 1 year but with in 3 years', ifelse(main_merge_df1$ircigrc == 4, 'More than 3 Year ago', 'Never Used'))))
main_merge_df1$ircigrc = as.factor(main_merge_df1$ircigrc)
table(main_merge_df1$ircigrc)

#Cigar
main_merge_df1$ircgrrc = ifelse(main_merge_df1$ircgrrc == 1, 'With in 30 days', ifelse(main_merge_df1$ircgrrc == 2, 'More than 30 days but with in 1 Year', ifelse(main_merge_df1$ircgrrc == 3, 'More than 1 year but with in 3 years', ifelse(main_merge_df1$ircgrrc == 4, 'More than 3 Year ago', 'Never Used'))))
main_merge_df1$ircgrrc = as.factor(main_merge_df1$ircgrrc)
table(main_merge_df1$ircgrrc)
df$ircgrfm = ifelse((df$ircgrfm == 91 | df$ircgrfm == 93), 0, df$ircgrfm)
#pipe
main_merge_df1$irpipmn = ifelse(main_merge_df1$irpipmn == 1, 'With in 30 days', ifelse(main_merge_df1$ircgrrc == 2, 'More than 30 days', 'Never Used'))
main_merge_df1$irpipmn = as.factor(main_merge_df1$irpipmn)
table(main_merge_df1$pipever)
main_merge_df1$pipever = as.factor(main_merge_df1$pipever)
df = main_merge_df1

#Alchohol

df$alcever = as.factor(df$alcever)
table(df$alcever)
#df$ircgrrc = ifelse(df$ircgrrc == 1, 'With in 30 days', ifelse(df$ircgrrc == 2, 'More than 30 days but with in 1 Year', ifelse(df$ircgrrc == 3, 'More than 1 year but with in 3 years', ifelse(df$ircgrrc == 4, 'More than 3 Year ago', 'Never Used'))))
df$iralcrc = ifelse(df$iralcrc == 1, 'With in 30 days', ifelse(df$iralcrc == 2, 'More than 30 days but with in 1 Year', ifelse(df$iralcrc == 3, 'More than 1 year ago', 'Never Used')))
df$iralcrc = as.factor(df$iralcrc)
df$iralcfy = ifelse((df$iralcfy == 991 | df$ircigfm == 993), 0, df$iralcfy)
table(df$iralcrc)

#weed
table(df$mjever)
df$mjever = as.factor(df$mjever)
df$irmjrc = ifelse(df$irmjrc == 1, 'With in 30 days', ifelse(df$irmjrc == 2, 'More than 30 days but with in 1 Year', ifelse(df$irmjrc == 3, 'More than 1 year ago', 'Never Used')))
df$irmjrc = as.factor(df$irmjrc)
table(df$irmjrc)
df$irmjfy = ifelse((df$irmjfy == 991 | df$irmjfy == 993), 0, df$irmjfy)

#cocaine
table(df$cocever)
df$cocever = as.factor(df$cocever)
df$ircocrc = ifelse(df$ircocrc == 1, 'With in 30 days', ifelse(df$ircocrc == 2, 'More than 30 days but with in 1 Year', ifelse(df$ircocrc == 3, 'More than 1 year ago', 'Never Used')))
df$ircocrc = as.factor(df$ircocrc)
table(df$ircocrc)
df$ircocfy = ifelse((df$ircocfy == 991 | df$ircocfy == 993), 0, df$ircocfy)

#crack
table(df$crkever)
df$crkever = as.factor(df$crkever)
df$ircrkrc = ifelse(df$ircrkrc == 1, 'With in 30 days', ifelse(df$ircrkrc == 2, 'More than 30 days but with in 1 Year', ifelse(df$ircrkrc == 3, 'More than 1 year ago', 'Never Used')))
df$ircrkrc = as.factor(df$ircrkrc)
table(df$ircrkrc)
df$ircrkfy = ifelse((df$ircrkfy == 991 | df$ircrkfy == 993), 0, df$ircrkfy)


#heroin
table(df$herever)
df$herever = as.factor(df$herever)
df$irherrc = ifelse(df$irherrc == 1, 'With in 30 days', ifelse(df$irherrc == 2, 'More than 30 days but with in 1 Year', ifelse(df$irherrc == 3, 'More than 1 year ago', 'Never Used')))
df$irherrc = as.factor(df$irherrc)
table(df$irherrc)
df$irherfy = ifelse((df$irherfy == 991 | df$irherfy == 993), 0, df$irherfy)

#heroin
table(df$herever)
df$herever = as.factor(df$herever)
df$irherrc = ifelse(df$irherrc == 1, 'With in 30 days', ifelse(df$irherrc == 2, 'More than 30 days but with in 1 Year', ifelse(df$irherrc == 3, 'More than 1 year ago', 'Never Used')))
df$irherrc = as.factor(df$irherrc)

#hallucinogens
table(df$hallucevr)
df$hallucevr = ifelse(df$hallucevr == 1, 1, ifelse(df$hallucevr == 91, 2, 0))
df$hallucevr = as.factor(df$hallucevr)
df$irhallucrec = ifelse(df$irhallucrec == 1, 'With in 30 days', ifelse(df$irhallucrec == 2, 'More than 30 days but with in 1 Year', ifelse(df$irhallucrec == 3, 'More than 1 year ago', 'Never Used')))
df$irhallucrec = as.factor(df$irhallucrec)
df$irhallucyfq = ifelse((df$irhallucyfq == 991 | df$irhallucyfq == 993), 0, df$irhallucyfq)

#LSD
df$irlsdrc = ifelse(df$irlsdrc == 1, 'With in 30 days', ifelse(df$irlsdrc == 2, 'More than 30 days but with in 1 Year', ifelse(df$irlsdrc == 3, 'More than 1 year ago', 'Never Used')))
df$irlsdrc = as.factor(df$irlsdrc)

#pcp
df$irpcprc = ifelse(df$irpcprc == 1, 'With in 30 days', ifelse(df$irpcprc == 2, 'More than 30 days but with in 1 Year', ifelse(df$irpcprc == 3, 'More than 1 year ago', 'Never Used')))
df$irpcprc = as.factor(df$irpcprc)

#esticay
df$irecstmorec = ifelse(df$irecstmorec == 1, 'With in 30 days', ifelse(df$irecstmorec == 2, 'More than 30 days but with in 1 Year', ifelse(df$irecstmorec == 3, 'More than 1 year ago', 'Never Used')))
df$irecstmorec = as.factor(df$irecstmorec)

#ketamine
df$irketminrec = ifelse(df$irketminrec == 1, 'With in 30 days', ifelse(df$irketminrec == 2, 'More than 30 days but with in 1 Year', ifelse(df$irketminrec == 3, 'More than 1 year ago', 'Never Used')))
df$irketminrec = as.factor(df$irketminrec)

#dmt
df$irdamtfxrec = ifelse(df$irdamtfxrec == 1, 'With in 30 days', ifelse(df$irdamtfxrec == 2, 'More than 30 days but with in 1 Year', ifelse(df$irdamtfxrec == 3, 'More than 1 year ago', 'Never Used')))
df$irdamtfxrec = as.factor(df$irdamtfxrec)

#salvia
df$irsalviarec = ifelse(df$irsalviarec == 1, 'With in 30 days', ifelse(df$irsalviarec == 2, 'More than 30 days but with in 1 Year', ifelse(df$irsalviarec == 3, 'More than 1 year ago', 'Never Used')))
df$irsalviarec = as.factor(df$irsalviarec)
#inhalants
table(df$inhalever)
df$inhalever = as.factor(df$inhalever)
df$irinhalrec = ifelse(df$irinhalrec == 1, 'With in 30 days', ifelse(df$irinhalrec == 2, 'More than 30 days but with in 1 Year', ifelse(df$irinhalrec == 3, 'More than 1 year ago', 'Never Used')))
df$irinhalrec = as.factor(df$irinhalrec)
df$irinhalyfq = ifelse((df$irinhalyfq == 991 | df$irinhalyfq == 993), 0, df$irinhalyfq)

#meth
table(df$methamevr)
df$methamevr = as.factor(df$methamevr)
df$irmethamrec = ifelse(df$irmethamrec == 1, 'With in 30 days', ifelse(df$irmethamrec == 2, 'More than 30 days but with in 1 Year', ifelse(df$irmethamrec == 3, 'More than 1 year ago', 'Never Used')))
df$irmethamrec = as.factor(df$irmethamrec)
df$irmethamyfq = ifelse((df$irmethamyfq == 991 | df$irmethamyfq == 993), 0, df$irmethamyfq)

#stimulants
table(df$stmnmlif) df$stmnmlif = ifelse((df$stmnmlif == 1 | df$stmnmlif == 5 | df$stmnmlif == 85), 1, ifelse((df$stmnmlif == 2 | df$stmnmlif == 91), 2, 0))
df$stmnmlif = as.factor(df$stmnmlif)
df$irstmanyrec = ifelse(df$irstmanyrec == 1, 'With in 1 year', ifelse(df$irstmanyrec == 2, 'More than 1 year', 'Never Used'))
df$irstmanyrec = as.factor(irstmanyrec)

#sedative
table(df$sednmlif)
df$sedanylif = as.factor(df$sedanylif)
df$irsednmrec = ifelse(df$irsednmrec == 1, 'With in 30 days', ifelse(df$irsednmrec == 2, 'More than 30 days but with in 1 Year', ifelse(df$irsednmrec == 3, 'More than 1 year ago', 'Never Used')))
df$irsednmrec = as.factor(df$irsednmrec)
df$cigyr = as.factor(df$cigyr)
df$cgryr = as.factor(df$cgryr)
df$pipflag = as.factor(df$pipflag)
df$tobyr = as.factor(df$tobyr)
df$alcyr = as.factor(df$alcyr)
df$mrjyr = as.factor(df$mrjyr)
df$cocyr = as.factor(df$cocyr)
df$crkyr = as.factor(df$crkyr)
df$heryr = as.factor(df$heryr)
df$hallucyr = as.factor(df$hallucyr)
df$lsdyr = as.factor(df$lsdyr)
df$pcpyr = as.factor(df$pcpyr)
df$ecstmoyr = as.factor(df$ecstmoyr)
df$damtfxyr = as.factor(df$damtfxyr)
df$ketminyr = as.factor(df$ketminyr)
df$salviayr = as.factor(df$salviayr)
df$inhalyr = as.factor(df$inhalyr)
df$methamyr = as.factor(df$methamyr)
df$sedanyyr = as.factor(df$sedanyyr)
df$sednmyr = as.factor(df$sednmyr)
table(df$iralcfm)
df$iralcfm = ifelse((df$iralcfm == 91 | df$iralcfm == 93), 0, df$iralcfm)
df$irmjfm = ifelse((df$irmjfm == 91 | df$irmjfm == 93), 0, df$irmjfm)
df$ircocfm = ifelse((df$ircocfm == 91 | df$ircocfm == 93), 0, df$ircocfm)
df$ircrkfm = ifelse((df$ircrkfm == 91 | df$ircrkfm == 93), 0, df$ircrkfm)
df$irherfm = ifelse((df$irherfm == 91 | df$irherfm == 93), 0, df$irherfm)
df$irhalluc30n = ifelse((df$irhalluc30n == 91 | df$irhalluc30n == 93), 0, df$irhalluc30n)
df$irinhal30n = ifelse((df$irinhal30n == 91 | df$irinhal30n == 93), 0, df$irinhal30n)
df$irmetham30n = ifelse((df$irmetham30n == 91 | df$irmetham30n == 93), 0, df$irmetham30n)
df$irpnrnm30fq = ifelse((df$irpnrnm30fq == 91 | df$irpnrnm30fq == 93), 0, df$irpnrnm30fq)
df$irstmnm30fq = ifelse((df$irstmnm30fq == 91 | df$irstmnm30fq == 93), 0, df$irstmnm30fq)
df$irsednm30fq = ifelse((df$irsednm30fq == 91 | df$irsednm30fq == 93), 0, df$irsednm30fq)
df$irsednm30fq = ifelse((df$irsednm30fq == 91 | df$irsednm30fq == 93), 0, df$irsednm30fq)
table(df$ndssansp)
df$cig_dep = main_merge_df1$ndssansp
df$cig_dep = ifelse(!is.numeric(df$cig_dep), 0, df$cig_dep)

levels(df$cig_dependence)
table(df$blnt30dy)
df$dnicnsp = as.factor(df$dnicnsp)
df$abodalc = as.factor(df$abodalc)
df$abodmrj = as.factor(df$abodmrj)

levels(df$abodmrj)
df$abodcoc = as.factor(df$abodcoc)
df$abodher = as.factor(df$abodher)
df$udpyhal = as.factor(df$udpyhal)
df$udpyinh = as.factor(df$udpyinh)
df$udpymth = as.factor(df$udpymth)
df$udpypnr = as.factor(df$udpypnr)
df$udpystm = as.factor(df$udpystm)
df$udpysed = as.factor(df$udpysed)
df$txltyill = as.factor(df$txltyill)
# # # Treated for drug use
df$txyrndill = as.factor(df$txyrndill)
# # # # Need for treatment
df$txyrndilal = as.factor(df$txyrndilal)
df$ndfltxill = as.factor(df$ndfltxill)
df$canceryr = ifelse(df$canceryr == 1 | df$canceryr == 5 | df$canceryr == 85, 1, 2)
df$bmi = ifelse(df$bmi2 < 18.5, 'Under Weight', ifelse(df$bmi2 > 18.5 && df$bmi2 < 24.9, 'Normal Weight', ifelse(df$bmi2 > 25 && df$bmi2 < 29.9, 'Over Weight', 'Obese')))
table(df$bmi2)
df$bmi = as.factor(df$bmi)
df$amhsvtyp = as.factor(df$amhsvtyp)
levels(df$amhsvtyp)
class(df$amhsvtyp)
df$amhsvtyp = ifelse(df$amhsvtyp == 8, 0, 1)
#demographics
table(main_merge_df1$nomarr)
df$nomarr2 = ifelse((main_merge_df1$nomarr2 == 1 | main_merge_df1$nomarr2 == 2), main_merged_df1$nomarr2, 0)
df$nomarr2 = as.factor(df$nomarr2)
levels(df$nomarr2)
table(main_merge_df1$service)
table(main_merge_df1$service)
df$service = ifelse((main_merge_df1$service == 1 | main_merge_df1$service == 2), main_merge_df1$service, 0)
df$service = as.factor(df$service)
levels(df$service)
df$combatpy = ifelse((df$combatpy == 1 | df$combatpy == 2), df$combatpy, 0)
df$combatpy = as.factor(df$combatpy)
levels(df$combatpy)
table(df1$health)
df$health = ifelse(main_merge_df1$health == 94 | main_merge_df1$health == 97, 0, main_merge_df1$health)
df$health = as.factor(df$health)
df$sexident = ifelse(df$sexident > 3, 0, df$sexident)
df$sexident = as.factor(df$sexident)
df$irsex = as.factor(df$irsex)
levels(df$income)
df$newrace2 = as.factor(df$newrace2)
table(df$irwrkstat)
df$irwrkstat = ifelse(df$irwrkstat == 99, 0, df$irwrkstat)
df$irwrkstat = as.factor(df$irwrkstat)
df$irmedicr = as.factor(df$irmedicr)

df$income = as.factor(df$income)
table(df$amhtxnd2)
df$amhtxnd2 = as.factor(df$amhtxnd2)
table(df$age_catagory)
library(rio)
df = import("Data1.RData")
library(dplyr)
df1 = subset(df, df$catag6 != 1)
df1$inhals = ifelse((df1$lsdyr == 1 | df1$pcpyr == 1 | df1$damtfxyr == 1 | df1$salviayr == 1), 1, 0)
df1$inhals = as.factor(df1$inhals)
table(df1$inhals)
df1$inhals1 = ifelse((df1$lsdyr == 1 | df1$pcpyr == 1 | df1$damtfxyr == 1 | df1$salviayr == 1 | df1$ecstmoyr == 1 | df1$ketminyr == 1), 1, 0)
df1$inhals1 = as.factor(df1$inhals1)
table(df1$inhals1)
df1$hallu = ifelse((df1$mrjyr == 1 | df1$methamyr == 1 | df1$hallucyr == 1 | df1$heryr == 1 | df1$cocyr == 1 | df1$crkyr == 1), 1, 0)
df1$hallu = as.factor(df1$hallu)
table(df1$hallu)
df1$tob = ifelse((df1$cigyr == 1 | df1$cgryr == 1 | df1$pipflag == 1), 1, 0)
df1$tob = as.factor(df1$tob)
table(df1$tob)
table(df1$blntever)
df1$blntever = as.factor(df1$blntever)


#correlation matrix and plot
library(dplyr)
cor_df1 = select(df, ircgrfm, iralcfm, irmjfm, ircocfm, ircrkfm, irhalluc30n, irinhal30n, irmetham30n, irpnrnm30fq, irstmnm30fq, irsednm30fq, blnt30dy)
cor1 = cor(cor_df1, use = "pairwise.complete.obs")
corrplot(cor1, method = "pie", title = "Correlation Plot")
df$phq9_score = df$phq0
df$gender = ifelse(df$irsex == 1, 'Male', 'Female')
#histogram of PHQ9 variable
ggplot(df, aes(x = phq9_score)) +
  geom_histogram(aes(y = ..density..),
    binwidth = 2, colour = 1, fill = "white")
#Density plot of PHQ9 variable
ggplot(df, aes(x = phq0)) +
  geom_density(color = "darkblue", fill = "lightblue") +
  labs(title = "Density of PHQ 9 Score ")
#histogram of log of PHQ9 variable
df$log_phq9_score = log(df$age_catagory)
ggplot(df, aes(x = log_phq9_score)) +
  geom_histogram(aes(y = ..density..), binwidth = 0.1, colour = "black", alpha = .5, position = "identity", alpha = 0.2, fill = "#FF6666") +
  labs(title = "Distribution of log(PHQ 9 Score)", x = "log(PHQ9 Score)", y = "Frequency")

#histogram of Phq9 score with respect to Race

ggplot(df, aes(x = irwrkstat, y = phq9_score, fill = irwrkstat)) + geom_boxplot() +
  labs(title = "Distribution of PHQ 9 Score /Race", x = "", y = "PHQ 9 Score") +
 #histogram of Phq9 score with respect to Age
ggplot(df1, aes(x = age_catagory, y = phq9_score, fill = age_catagory)) + geom_boxplot() +
  labs(title = "Distribution of PHQ 9 Score / Age", x = "", y = "PHQ 9 Score")

#histogram of Phq9 score with respect to Gender
ggplot(df1, aes(x = gender, y = phq9_score, fill = gender)) + geom_boxplot() + labs(title = "Distribution of PHQ 9 Score / gender", x = "", y = "PHQ 9 Score")

#models building
library(AER)
m1 = lm(phq0~ircgrfm + alcyr + tob + iralcfm + hallu + irmjfm + ircocfm * ircrkfm + irherfm +
  irhalluc30n + inhals1 + irinhal30n +
  irmetham30n + irpnrnm30fq + irstmnm30fq + irsednm30fq + stmnmlif + sednmyr + txyraldgb +
  +dnicnsp + abodalc + abodmrj + abodcoc + abodher + udpyhal + udpyinh + udpymth + udpypnr + udpystm +
  udpysed + txltyill + txyrndill + txyrndilal + ndfltxill +
  canceryr + amhsvtyp + amhtxnd2 +
  service + health + combatpy + irsex + newrace2 + irwrkstat + irmedicr + income, data = df1)

m2 = lm(phq0~ircgrfm + alcyr + tob + iralcfm + hallu + irmjfm + ircocfm * ircrkfm + irherfm +
  irhalluc30n + inhals1 + irinhal30 + irmetham30n + irpnrnm30fq + irstmnm30fq + irsednm30fq + stmnmlif + sednmyr + txyraldgb +
  +dnicnsp + abodmrj + abodcoc * udpyinh + udpysed + abodher + udpyhal + abodalc * udpyinh + udpymth + udpypnr + udpystm +
  txltyill + txyrndill + txyrndilal + ndfltxill +
  canceryr + amhsvtyp + amhtxnd2 +
  service + health + combatpy + irsex + newrace2 + irwrkstat + irmedicr + income, data = df1)

install.packages("AER")
library(AER)
m3 = tobit(phq0~ircgrfm + alcyr + tob + iralcfm + irmjfm + ircocfm * ircrkfm + irherfm +
  irhalluc30n + inhals1 + hallu + irinhal30n +
  irmetham30n + irpnrnm30fq + irstmnm30fq + irsednm30fq + stmnmlif + sednmyr + txyraldgb +
  +dnicnsp + abodalc + abodmrj + abodcoc + abodher + udpyhal + udpyinh + udpymth + udpypnr + udpystm +
  udpysed + txltyill + txyrndill + txyrndilal + ndfltxill +
  canceryr + amhsvtyp + amhtxnd2 +
  service + health + combatpy + irsex + newrace2 + irwrkstat + irmedicr + income, left = 3, right = 27, data = df1)

m4 = tobit(phq0~ircgrfm + alcyr + tob + iralcfm + hallu + irmjfm + ircocfm * ircrkfm + irherfm +
  irhalluc30n + inhals1 + irinhal30n +
  irmetham30n + irpnrnm30fq + irstmnm30fq + irsednm30fq + stmnmlif + sednmyr + txyraldgb +
  +dnicnsp + abodmrj + abodcoc * udpyinh + udpysed + abodher + udpyhal + abodalc * udpyinh + udpymth + udpypnr + udpystm +
  txltyill + txyrndill + txyrndilal + ndfltxill +
  canceryr + amhsvtyp + amhtxnd2 +
  service + health + combatpy + irsex + newrace2 + irwrkstat + irmedicr + income, left = 3, right = 27, data = df1)
summary(m4)

stargazer(m1, m2, m3, m4, type = 'text', single.row = TRUE)
plot(m3)

#assumptions check

# # #Linearity
# Plot the residuals against the fitted values
plot(m2)

# multi collinearity
library(car)
vif(m2)

#independence
library(lmtest)
dwtest(m2)