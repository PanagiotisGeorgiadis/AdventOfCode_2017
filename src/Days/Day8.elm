module Days.Day8 exposing (getPuzzleAnswer, getPuzzleAnswer2)


type alias Register =
    { name : String
    , value : Int
    }


emptyRegister : Register
emptyRegister =
    { name = ""
    , value = 0
    }


getPuzzleInput : String
getPuzzleInput =
    "oui inc 550 if p <= 3\nabh inc -189 if g == 0\nkq inc 164 if znl != 7\nkq dec 827 if oui == 550\nz inc 469 if znl != -9\ney inc 685 if tk == 0\nkq dec 388 if y > -7\nkq inc 468 if tk < 4\noui inc 831 if un <= -5\ntk inc -676 if tx >= -8\nz inc 418 if kq <= -576\nid inc -316 if p >= -2\ny inc 943 if g <= -2\ng inc -646 if h <= 4\ntx inc 47 if tx <= -10\nun inc 486 if l < 9\nid inc -796 if l < 3\nekl dec 269 if id < -1109\nekl dec -503 if tk > -685\noqg inc -704 if lb < 1\nhpz dec -256 if c >= -1\ny dec 320 if kq <= -577\nznl dec -741 if g != -644\nlb inc 584 if id > -1103\np dec -280 if p >= 7\nz dec -389 if oqg < -698\na inc 61 if p == 0\nhpz dec -184 if id > -1118\nid dec -33 if ehe <= 6\noui inc 994 if l <= 9\na dec -548 if ey >= 676\np inc -434 if h != -8\nun dec 464 if lb != 0\nxj inc 285 if oqg <= -702\nh inc -758 if a < 601\ntx inc 465 if tk < -674\nhpz dec 393 if ekl == 236\nid dec 0 if tk < -667\nznl dec 802 if ey == 685\nl inc 617 if ehe <= 7\nc inc 699 if g <= -642\ntk inc 27 if c != 691\nehe inc 213 if kq <= -581\nx dec 550 if l > 608\nc dec -503 if znl >= -61\noqg inc 304 if lb > -7\na inc 262 if un == 486\ntx inc 475 if znl != -65\nz inc -802 if g != -645\noui inc 301 if lb >= -4\nid inc -642 if a != 881\nxj dec 394 if kq > -587\ny dec -685 if l == 617\nid dec -55 if kq != -583\nid dec 402 if ehe > 215\nh inc 120 if lb >= -3\nid dec 492 if ehe <= 216\ntk inc 591 if hpz != 441\nc inc -790 if h < 128\nkq dec 281 if ekl >= 225\np inc 300 if ey > 675\nh inc -822 if z > 478\noqg inc -187 if l == 617\nkq inc -625 if l == 617\nehe inc 706 if g != -655\noqg inc -489 if c < 409\ng dec 603 if kq <= -1486\nh dec -903 if ekl < 236\na inc 447 if a >= 868\na inc 448 if l >= 609\noui dec 542 if h == 1023\na inc -377 if lb < 8\noqg dec 417 if oqg == -587\noui dec -348 if y <= 370\nx dec 21 if id < -2205\nznl inc 206 if znl >= -67\nznl dec -230 if xj <= -106\nznl inc 913 if c != 412\nznl dec 544 if c <= 405\na dec -72 if p < -127\nkq dec 495 if tx != 936\nh dec -203 if l != 608\nhpz dec -764 if a >= 1459\nxj dec 57 if lb > -3\nznl dec 437 if x > -579\nlb inc -473 if ehe >= 916\nc dec 354 if y <= 365\nh dec -764 if z != 474\nlb inc -77 if tk == -58\ney inc 942 if abh != -182\nid dec 21 if y > 369\ny dec 589 if lb <= -549\nhpz inc 792 if lb < -541\nc dec 630 if tk >= -60\noqg inc -491 if ehe != 919\nx dec -153 if z == 474\nlb inc -240 if a == 1461\nlb inc -620 if ehe > 917\ney inc 751 if id > -2221\noui inc 896 if h >= 1226\nkq inc 531 if ekl >= 231\na dec -381 if znl >= -69\nznl dec 659 if tk < -49\nxj dec 26 if p == -134\nkq dec 929 if oui < 2539\ny dec 880 if c < -573\nun inc 737 if tk <= -68\nehe dec 497 if l < 622\ng inc -193 if kq <= -1453\na dec 695 if l < 618\nh inc 526 if ey >= 2388\ny dec 769 if g == -1442\nznl dec 923 if ey < 2379\nx dec -167 if ekl < 235\nekl dec 652 if xj < -192\nc dec -352 if z >= 467\nabh dec -251 if xj > -202\ntk inc -214 if z < 475\nx dec 393 if hpz < 2006\nhpz dec -941 if xj >= -182\nx dec 980 if ekl <= 243\nhpz dec 886 if g >= -1447\na inc 157 if oui >= 2540\nid dec -694 if ehe >= 413\nid dec 137 if y > -999\nh dec -24 if a == 1304\nid inc 68 if oui <= 2552\np inc -863 if tx <= 944\nx inc 221 if h == 1250\nl dec 700 if l >= 616\na inc -360 if tx != 939\ny dec 797 if x != -1401\nc dec -25 if y >= -1798\nc dec 401 if lb >= -1409\nc dec -164 if znl <= -1647\nekl inc 494 if y == -1787\nun dec -432 if oqg >= -1010\nc inc 399 if a <= 947\nun dec -738 if c <= 204\nl inc -863 if y >= -1797\nabh inc -125 if znl < -1636\na dec -376 if id > -1592\na inc 392 if z > 470\nx inc 281 if h >= 1241\nlb inc -264 if kq >= -1458\nekl dec 310 if a >= 1704\nhpz inc 132 if lb > -1670\nznl inc -870 if xj <= -198\nx dec -276 if g >= -1439\nabh inc 684 if hpz != 1110\nlb inc -214 if l < -945\noui dec -135 if ekl != -76\nun dec 188 if ey > 2375\nhpz dec -72 if tk != -278\ny inc -141 if kq >= -1443\nx inc 174 if kq != -1462\nekl inc 325 if h == 1256\nc inc 534 if oui == 2547\noui inc 781 if z == 474\nlb dec -733 if h == 1250\nh inc -441 if un != 1467\nid dec -16 if oqg < -1005\nekl dec 842 if ey >= 2369\ng inc -995 if a < 1718\noqg inc 313 if tk == -272\na dec -707 if oui >= 3319\nhpz inc 957 if y <= -1797\nh dec 270 if hpz < 1183\nlb inc -632 if g > -2432\nc inc -96 if abh < -62\na dec -305 if z != 474\ny dec 679 if oui == 3328\ntk inc 949 if oui < 3332\nx dec 53 if abh < -54\ng dec 55 if l > -953\nxj inc -327 if abh > -64\nabh inc 643 if abh < -55\nlb inc -146 if y <= -2461\nl dec 763 if y >= -2473\noui dec -787 if a < 2422\np inc 419 if l == -1709\nl dec -307 if x >= -1009\nc dec 731 if x != -996\ny inc 150 if oqg != -682\ntx dec -673 if g > -2498\nkq inc -895 if l == -1402\nxj dec -817 if un == 1468\ney inc 482 if z == 474\nh inc -475 if ekl <= -921\nhpz inc 526 if l > -1407\nznl inc 956 if tk < 680\nlb dec -922 if lb > -1304\nekl dec 533 if y >= -2314\ng dec -727 if xj >= 291\nun dec -7 if ehe == 422\nx inc -587 if g == -1765\nun inc -786 if c != -83\nl inc -238 if h != 542\nun inc 267 if znl == -688\nz inc -500 if ey <= 2850\nl dec 673 if ekl > -921\ney dec 562 if z < 477\nhpz dec -179 if oui != 4119\nun dec 486 if hpz == 1887\noui inc 649 if tx != 1613\nx dec -124 if z >= 472\ny inc 807 if z <= 482\ny inc 145 if ekl <= -910\nxj inc 477 if p > -579\nznl inc -472 if tk < 678\ny inc 955 if z > 480\nznl dec 399 if abh > 576\nznl inc -452 if znl <= -1557\nz dec 204 if id > -1580\nhpz dec -475 if z < 478\nid dec -449 if abh <= 576\nlb dec 59 if ey <= 2288\nlb inc 304 if id != -1587\nkq dec 192 if l <= -2309\nabh inc 861 if id > -1598\nkq inc -240 if p == -578\nl dec 246 if a <= 2422\ng dec 356 if c > -82\ntx dec -341 if tk == 677\nhpz dec -325 if h != 535\nc dec 377 if l >= -2559\nehe inc 826 if znl == -2011\nc dec 989 if xj <= 777\nh dec 376 if ehe != 1254\noqg inc -268 if id != -1578\nlb inc 816 if ekl >= -921\nznl dec 131 if hpz >= 2692\nun inc 859 if tk >= 674\np inc 972 if h != 167\ntk inc -69 if g == -1765\nl inc -787 if oqg == -954\noqg inc -649 if x != -1460\np dec 188 if c > -1459\nun dec 411 if xj != 770\nkq inc -658 if a > 2415\ng dec 396 if y != -1362\nekl inc -220 if znl != -2004\nlb inc 711 if lb <= 736\nid dec 80 if a <= 2424\nz dec -808 if g <= -2152\nz dec -201 if p <= 209\na inc -309 if g <= -2161\noui dec -254 if hpz >= 2687\nh inc 504 if un < 924\nlb inc -231 if y < -1361\nid inc 482 if ehe <= 1248\nx inc -651 if oqg != -1612\nabh inc 516 if tk <= 608\nxj inc 30 if ekl > -1140\nznl dec -912 if id < -1178\nabh dec 419 if z > 1473\nkq dec -944 if h <= 672\ntk dec 685 if ekl <= -1135\nc inc -272 if ehe < 1258\nekl inc 287 if h > 666\noqg inc -993 if ekl > -853\np inc 726 if h >= 674\noui dec -557 if kq >= -2502\ntk inc -742 if tk != -81\noqg inc -797 if h == 667\noqg dec -107 if znl < -1093\ntk inc 497 if g == -2161\nc dec -226 if c == -1727\ntx dec 817 if oqg <= -3283\ny dec 719 if ey >= 2296\noui dec 42 if y == -2086\ny dec -231 if y <= -2078\np inc -190 if ekl <= -842\nc dec -533 if znl == -1099\ny dec -678 if z >= 1474\nhpz inc 591 if ekl != -848\np dec 47 if h <= 676\np inc 729 if tx >= 1136\ney dec -36 if c <= -962\noqg inc -554 if ey <= 2338\ntx dec 648 if hpz <= 3281\ney dec -746 if xj <= 805\nkq inc -14 if x <= -2106\nabh dec 931 if lb != 509\nxj inc -230 if p != 697\nid inc 458 if l == -2559\nl dec -143 if ehe <= 1250\noui inc 411 if y <= -1172\nc dec 292 if id < -723\nz inc 649 if tk > -326\ng inc 161 if abh <= 610\noui inc 23 if c == -1260\nxj dec -478 if ehe == 1248\nid dec -153 if a < 2112\nx dec -616 if tk == -322\nxj dec -194 if znl >= -1106\ntx dec 220 if ekl < -855\nx inc 139 if z != 2141\na inc 777 if abh <= 609\noui inc 151 if x == -1360\ng inc 69 if id <= -575\nekl inc 860 if xj <= 1256\nx dec 309 if x != -1367\nznl inc -405 if y >= -1184\nlb inc 428 if tx == 489\nznl inc -676 if tx != 497\noqg dec 780 if ey != 3080\nun inc 476 if xj > 1240\nc dec -982 if l != -2422\nx inc 667 if y > -1186\nkq dec 277 if tk > -324\noqg dec -271 if kq >= -2792\nlb dec 960 if a > 2877\nehe dec 532 if x < -1011\nlb inc 619 if x == -1002\nhpz inc -585 if tk == -322\np dec 553 if id != -569\nh dec 279 if c > -287\noui inc 832 if oui > 5471\nkq dec -828 if ey != 3082\nxj inc -229 if ehe == 1257\np inc -505 if id != -575\ny dec -94 if xj <= 1252\nh dec 885 if g > -1923\nc dec -38 if kq != -1964\noui inc 19 if l <= -2415\nehe dec 543 if oqg > -3580\nlb inc -394 if l >= -2420\ntx dec -673 if hpz != 2695\nh dec -436 if oui > 5495\nznl inc 826 if oui < 5480\nznl inc -134 if ey <= 3082\nc dec 808 if kq >= -1957\ntx inc -45 if abh <= 613\nx dec 30 if hpz != 2686\na dec 440 if znl == -2314\nc inc -504 if z <= 2140\ntx inc 435 if y <= -1075\nx dec 256 if ehe < 706\nc inc 187 if p != 145\ney dec -323 if id > -576\nhpz dec 174 if y >= -1080\noui dec 455 if un == 1394\noqg inc -804 if a <= 2447\nabh dec 741 if l == -2416\ny dec -566 if z != 2127\nkq inc 919 if id >= -575\nid dec 220 if znl < -2319\ng inc -15 if lb >= 197\nabh inc -968 if ey != 3395\nxj inc 873 if l != -2415\nx dec -367 if x == -1288\nun inc -62 if g == -1946\nh inc -400 if tk < -325\nxj inc -623 if h > 397\na dec 49 if un < 1341\nekl inc 491 if id >= -582\ntk inc 171 if ey >= 3405\nhpz inc -265 if ekl != 500\nehe dec -811 if lb <= 212\nehe inc 477 if hpz != 2702\noqg dec 137 if ekl <= 500\nz dec -601 if ekl == 500\nehe dec -696 if y >= -510\nehe dec -616 if oui > 5038\np inc 584 if xj == 2120\nabh inc -131 if z < 2734\na inc 62 if kq >= -1046\nekl dec -26 if oui >= 5030\nabh dec -64 if lb == 203\nxj dec 356 if tk < -320\nun inc 270 if hpz <= 2702\nl dec -632 if oqg != -4521\nx dec 69 if tx != 1555\nkq inc -685 if hpz == 2693\nid inc -655 if p > 729\ntx inc -763 if znl >= -2310\nc inc 250 if y <= -508\nkq inc 738 if l == -1784\ntk dec -548 if znl < -2310\nz dec -757 if ey >= 3403\nehe dec -969 if tk == 226\ng inc 312 if lb <= 206\nl inc 218 if hpz > 2685\nh dec -500 if ey > 3400\na inc 612 if ekl > 522\noqg dec 134 if c == -1302\ntk dec -622 if oqg < -4641\np inc -715 if ekl < 522\nhpz dec -862 if abh <= -1166\nkq dec 183 if a == 3069\na dec -934 if p >= 722\noui inc -474 if ey <= 3403\nid dec 36 if ey != 3403\nz dec 285 if x == -990\nz dec 924 if g <= -1626\noqg inc -564 if xj <= 1755\nkq dec -597 if ehe <= 2952\nh inc 312 if y != -517\nkq inc -911 if ekl <= 528\nehe dec 871 if l == -1566\na dec 35 if c == -1302\nhpz dec 812 if g >= -1632\nlb inc 674 if ey <= 3406\noui dec -729 if tk == 848\nz inc 11 if xj != 1766\nabh dec 35 if znl == -2314\ny inc -62 if abh != -1211\ng inc -480 if oqg == -4649\ntx dec 224 if l <= -1563\ntk dec -639 if un == 1602\nehe dec 825 if kq != -1904\ntk dec -520 if c == -1302\nun inc 560 if id >= -581\nid dec -68 if c != -1296\nkq dec -722 if ehe <= 1271\nh inc 629 if l == -1558\nznl inc 447 if ehe >= 1264\nehe inc -375 if x > -999\nabh inc 135 if ekl <= 528\nabh inc -532 if c != -1303\ney dec -898 if oqg != -4659\ntx inc 149 if ekl > 523\nz inc 140 if un != 2166\ny inc -737 if znl != -1874\nid inc -858 if lb >= 874\nl inc -444 if oui != 5296\nx inc -401 if xj <= 1772\nun dec 422 if y != -1325\nx inc -459 if hpz > 3545\nx inc 671 if l == -2010\noui dec -26 if ekl > 534\nz dec 813 if ekl <= 534\ntx dec -172 if c == -1298\ney dec 544 if g == -2114\nc inc -700 if c == -1302\nl inc -951 if un != 1740\nid dec 446 if ehe <= 881\ntk dec -758 if z > 1615\nx inc -854 if xj < 1770\na dec -739 if y != -1322\nlb dec 564 if tx >= 1468\nhpz inc 526 if id == -1359\ney dec -759 if kq > -1178\ney inc -765 if ey > 4513\nekl inc 354 if oui <= 5289\nc inc -66 if tx >= 1472\nh inc 9 if ekl != 888\nekl inc -247 if x > -2036\nx inc 832 if xj != 1770\nabh inc -867 if znl <= -1858\nc inc 564 if l < -2005\nxj dec 936 if lb <= 309\nl inc 762 if x >= -1210\ney dec -862 if oqg == -4650\ntx inc -136 if ey != 3760\noui inc -928 if x <= -1193\nlb dec 325 if p == 728\na dec -157 if x != -1204\nlb dec -832 if lb != 315\na inc -802 if h == 897\nx inc -882 if id <= -1358\nkq inc -98 if kq == -1174\noqg dec 64 if ey != 3751\nhpz inc -582 if z > 1614\nh dec 335 if ehe != 888\ney dec -137 if znl <= -1862\nid dec 491 if a <= 4067\nz inc -747 if z >= 1617\nun inc -429 if un > 1735\ntx inc 536 if un <= 1312\ntk inc 360 if xj != 1764\ntx inc 723 if l < -1242\nehe dec -74 if tx <= 2604\nc inc 326 if a > 4072\nlb dec -178 if z <= 874\na dec -218 if abh >= -2471\np inc 204 if z < 877\nid dec 496 if id <= -1855\noqg inc 1 if x == -2083\nabh inc 84 if un <= 1314\nznl dec 396 if abh < -2380\nx dec -94 if ekl >= 629\nekl inc 741 if un <= 1311\nl inc -187 if y > -1321\nun inc 576 if hpz <= 2976\np dec 334 if ehe > 956\nhpz dec 2 if x > -1993\noqg dec -150 if g <= -2106\nlb dec -290 if x > -1982\nkq dec -16 if oqg >= -4502\nekl inc -135 if un >= 1882\nid dec -491 if z <= 879\nz dec 311 if h > 556\ng inc -942 if tx <= 2606\noui dec 917 if lb != 1329\ntk dec 650 if a == 4283\nabh dec -623 if y > -1312\nx dec 645 if c == -1504\nun dec 335 if id <= -1861\nekl dec -160 if z < 570\ntk inc 968 if ekl != 1406\ng dec -298 if un >= 1545\nkq inc -814 if id >= -1852\nehe inc -766 if y < -1314\nh dec 540 if z != 555\nx dec 683 if xj == 1771\nx inc -258 if ehe == 199\nl inc 452 if oui != 3451\nhpz inc -294 if y != -1310\ntk inc -785 if un <= 1552\na dec -752 if c < -1502\nun inc 529 if ekl != 1403\nxj inc -551 if l == -992\ny inc 135 if znl > -2266\ntk inc -439 if x == -2892\nl dec 195 if x <= -2888\nhpz dec 683 if l > -1182\nz dec -486 if tk == 1859\na inc 858 if a > 5035\nc inc 683 if abh < -2376\nh inc -93 if oqg != -4498\nid dec -46 if x != -2890\nun inc 181 if a > 5037\nabh inc -798 if y < -1184\nid dec -912 if oui < 3449\na dec 526 if z <= 1037\ney inc 510 if id >= -909\nl inc 930 if hpz != 1987\nid inc -640 if ehe >= 196\nxj inc -318 if lb == 1315\noui dec -797 if x <= -2889\nhpz inc -563 if y == -1187\nlb inc -77 if tk <= 1858\nid dec 692 if un <= 2088\ntk inc -45 if znl > -2266\nabh inc 802 if hpz < 2002\nabh dec 262 if h < 31\nid dec 547 if tx != 2600\nh inc -48 if p != 599\nx dec -424 if ey == 4398\nkq dec 584 if oui == 4240\nlb dec -899 if kq > -1846\ntk dec 417 if a != 5045\nx dec 988 if oui != 4250\nehe inc 423 if hpz <= 2000\ntk dec 497 if p == 599\na dec 201 if tk != 895\nabh dec -140 if abh == -1844\nid inc 455 if oqg == -4498\np inc 447 if xj == 1764\nl inc -653 if p != 1046\na inc 226 if l != -245\na inc 491 if c < -827\nx inc 942 if hpz < 2001\ntx dec 52 if h <= 26\na dec 962 if kq < -1836\ntk inc 980 if id > -1781\nhpz inc 655 if un <= 2088\nkq inc -389 if oui >= 4236\nznl dec 334 if z >= 1040\nc inc -985 if p < 1045\nlb dec -597 if g == -2768\ntk dec -356 if ekl != 1399\nid dec -953 if g < -2755\noqg inc 400 if oui >= 4233\ntk dec 14 if p <= 1050\nehe dec -657 if a > 4089\noqg inc -902 if x >= -2520\nun inc -276 if tx != 2543\ney inc 734 if tk < 1875\nznl inc -685 if ey > 5125\nlb inc 959 if oui > 4242\nxj inc 84 if ekl > 1393\nxj dec 355 if oqg < -4995\na inc -711 if oqg > -5007\nc dec 488 if p >= 1043\nznl inc 222 if g >= -2752\nz dec -169 if un < 1811\ntx inc -379 if abh < -1696\nznl inc 435 if un > 1803\noqg inc 342 if id >= -834\nc inc -760 if ey <= 5127\nid dec 750 if z > 1208\nxj inc -994 if g != -2755\nehe inc 499 if y > -1188\noqg inc 643 if xj == 499\nhpz dec 85 if y > -1186\nabh inc -174 if un >= 1802\ng dec 898 if ekl >= 1390\ng inc -590 if a > 3384\nznl inc 486 if id >= -1585\nlb dec -650 if y != -1182\nehe dec -634 if id == -1577\ntx inc -150 if un != 1805\nhpz dec -610 if l > -250\nl inc -648 if z <= 1216\ny inc 607 if abh != -1881\ney inc 747 if oui > 4230\ntk dec 125 if g > -4256\ng inc 511 if a >= 3384\ntx inc -751 if hpz != 3178\nz inc -928 if ehe >= 2409\nlb inc -278 if kq >= -2236\nun inc -336 if c >= -1304\nid dec -908 if znl <= -2354\ny dec -183 if tk < 1733\ntk dec -92 if h <= 24\nkq dec -34 if hpz != 3174\nx inc -991 if oui > 4247\nl inc -644 if oqg < -4013\nhpz dec -690 if y >= -568\nehe inc 171 if ekl <= 1399\na inc -253 if g == -3735\nid inc 281 if tx > 1409\nz inc 835 if tk <= 1841\nznl inc -647 if y != -574\nznl dec -991 if ehe == 2583\noqg dec -706 if ekl == 1399\np dec -870 if lb == 2596\nun dec 293 if x <= -2513\nz inc 418 if z >= 1117\ntk dec -61 if tx < 1422\noui dec -569 if ey < 5871\nznl inc -335 if g <= -3729\nehe dec 509 if hpz > 3175\noqg dec -24 if tk == 1894\nid dec 73 if a != 3138\nun dec 220 if y != -574\nz inc 707 if ekl < 1405\np inc 238 if tk != 1893\np inc 667 if lb >= 2592\nl dec -927 if ey == 5875\nehe inc -787 if z != 2248\nznl inc 82 if znl == -1705\nabh dec 839 if a <= 3142\nekl dec 22 if ekl > 1396\nz dec 402 if y == -574\ney inc -732 if kq != -2229\nx dec 869 if ey < 5888\nlb dec 137 if y >= -582\na inc 204 if z == 1846\nh inc 280 if hpz == 3181\nehe dec 876 if id != -459\nl dec -156 if oui == 4248\noui dec 670 if hpz >= 3170\nid dec -485 if z > 1842\nz dec 40 if p > 1946\nkq dec 671 if ey > 5872\na dec 745 if tx <= 1420\ny dec 985 if tk == 1894\ny inc 668 if l == -1540\ng inc -231 if hpz == 3174\nznl inc -481 if p > 1948\nhpz inc -14 if kq < -2900\nekl dec 372 if oqg <= -3285\nehe dec -176 if abh == -2717\nl inc 865 if p >= 1942\ntx inc -587 if g <= -3962\na dec -679 if h <= 27\ney inc -261 if hpz != 3165\nl dec -486 if tx > 829\nehe dec 913 if z > 1804\ney dec -431 if x == -3383\ng dec 998 if y == -891\na inc -720 if hpz <= 3176\nun dec 753 if hpz < 3174\nl inc 740 if l < -182\noui inc -212 if oui <= 3578\noqg inc 363 if tx > 824\nx dec 296 if p <= 1956\noqg dec 480 if oui == 3358\nx inc -178 if abh <= -2724\nx inc -579 if tx > 830\nlb dec -188 if tx == 831\nekl dec 544 if un >= 1512\nekl inc 284 if c != -1304\nid dec -418 if oui > 3365\na inc 12 if h < 19\nlb dec 73 if ekl != 745\nc inc 594 if id >= 24\ng inc -118 if xj <= 506\nid inc 274 if x >= -4263\nx dec -248 if oui != 3350\nehe inc -431 if abh >= -2719\ny inc -740 if y < -885\np inc -842 if znl <= -2095\ng dec -101 if tx != 831\nun inc -708 if id == 298\nid inc 788 if id <= 302\nehe dec -4 if oqg <= -3399\nh dec 904 if ekl >= 736\noui dec -828 if tx >= 823\nz dec 309 if tk != 1894\ney inc 744 if tk > 1901\nznl inc 133 if ehe <= 550\na inc -908 if z != 1810\ntk inc -464 if h != -889\nh inc 59 if ey > 6042\nx inc -841 if l == 551\nabh inc 293 if ey > 6047\ntx inc 410 if un <= 813\nz inc 218 if ehe >= 538\nxj inc -875 if a >= 1635\nkq inc -793 if abh < -2415\noqg dec 361 if h == -823\ntx inc -847 if xj >= -378\nhpz dec 725 if a <= 1641\nlb dec -740 if h < -830\nhpz dec 259 if h < -818\nid inc 353 if kq != -3687\noui inc 540 if p == 1109\nlb dec -235 if tx > 392\nhpz dec -601 if h > -826\noqg dec 287 if oqg == -3763\noqg dec -965 if abh < -2433\nid inc 172 if oui > 4722\nz dec -226 if ey <= 6054\nkq dec -173 if x >= -4859\ny inc -123 if un > 798\nlb inc 522 if kq < -3514\nabh dec 543 if znl != -1973\nid inc -418 if hpz == 3516\ntk dec -115 if abh <= -2966\nx dec 501 if ehe > 533\noui dec -460 if kq > -3524\nl dec -712 if g == -5084\nc inc -239 if tx < 398\nabh dec 956 if oqg < -4041\nx dec 357 if id != 1201\nun dec 45 if tx == 394\nz inc -123 if ekl != 748\ng inc 479 if p > 1099\na inc 942 if id >= 1186\nid inc -788 if oqg >= -4057\ntk dec -821 if y > -1762\ng dec -672 if tk < 2371\ney inc 647 if oui > 5179\nx inc -382 if lb == 3402\nid inc 742 if lb >= 3394\nhpz inc 631 if x >= -6097\nh dec -368 if p > 1101\nekl inc 44 if ehe == 543\np dec -420 if l > 549\ny inc -539 if tk < 2365\nabh dec -516 if tx < 395\ney dec -752 if hpz != 4147\nz inc 970 if tk == 2362\ny inc 698 if g < -3933\ney inc -131 if l != 541\ntx inc -663 if c < -954\nz inc -161 if l >= 544\nkq inc -616 if g >= -3931\ntk inc -915 if oui <= 5188\ney dec 978 if id == 1141\ny dec -430 if ehe <= 541\nkq dec -129 if tk <= 1448\ny dec -319 if x == -6091\nznl inc -192 if x < -6086\noqg dec 560 if ey <= 6565\nehe dec 531 if ey == 6565\nabh dec -732 if xj < -372\nxj inc 421 if kq < -4135\nx inc 85 if un >= 755\nc dec -26 if oqg != -4602\noqg dec 943 if a != 2576\ney dec -370 if oqg == -5560\noqg dec 620 if ey <= 6561\ntx dec -308 if oqg == -5553\nznl inc 123 if ehe <= 19\nehe inc 848 if a >= 2577\ntk dec 679 if z < 1970\nc inc -339 if z > 1963\nid inc 349 if lb <= 3407\nx inc -88 if oui > 5177\nhpz dec 617 if oui <= 5185\noqg dec 696 if z > 1964\noqg dec -984 if z != 1966\nlb dec -904 if un > 767\noqg inc -480 if p > 1534\nc inc 496 if un < 769\ng dec -564 if oqg > -6256\nehe inc -874 if abh > -2674\nl inc -20 if l == 551\nlb inc 962 if ey != 6575\nhpz dec 99 if ekl <= 792\nl dec 941 if y != -1443\ney dec 621 if g <= -3361\nxj dec -474 if oui >= 5183\nxj inc 807 if g != -3364\nabh inc -75 if a < 2593\nkq dec 57 if c <= -770\nhpz dec 274 if p != 1529\noqg inc -927 if ey == 5944\nc dec 171 if g > -3372\np inc 54 if xj == 1326\nehe dec 249 if oui >= 5184\nehe dec 315 if un < 765\nlb dec 545 if y < -1429\nznl dec 998 if hpz > 4049\nz inc -122 if hpz <= 4057\nznl inc 620 if kq > -4197\noqg inc -349 if un == 759\ntk dec -186 if h == -455\noui inc 717 if ekl <= 798\nxj dec 701 if h >= -456\nun inc -50 if tx < 709\nlb dec -784 if h < -452\ntx inc 175 if tx < 710\ntk dec -575 if ey != 5944\noui dec 856 if lb < 4604\nehe dec 179 if abh > -2746\nhpz dec 537 if xj < 622\ney inc -862 if y <= -1427\noqg inc 104 if abh <= -2744\nkq dec 453 if p == 1583\nekl dec -587 if tk == 958\ntk dec 309 if tx == 877\noui dec -628 if y < -1425\nkq dec 509 if x >= -6096\nxj dec 953 if oqg != -7412\nlb dec -435 if lb != 4595\nc dec 341 if id == 1496\nx inc 796 if x < -6093\nhpz inc 401 if g > -3365\nznl inc -36 if x > -5303\nh inc 282 if oqg != -7419\nekl dec 802 if z >= 1838\nc inc 586 if ehe != 305\np dec -293 if g < -3371\ney inc 125 if kq > -5158\nekl inc -108 if abh != -2753\nekl inc -848 if xj != -324\noui dec 801 if ey > 5211\nx inc 704 if abh == -2750\nz inc -759 if ehe == 296\ng inc -964 if ehe < 301\nehe inc 307 if xj > -330\nc inc -272 if ehe == 603\ney dec -497 if un != 700\nlb dec 533 if c >= -978\ny inc 864 if z == 1085\nekl inc -895 if x < -4590\nabh inc -424 if xj != -324\nlb dec -756 if l == -418\nxj inc 23 if g == -4328\nznl inc 716 if g >= -4322\nh dec -669 if l <= -409\noui dec -305 if lb >= 4498\nun dec 664 if id <= 1493\nhpz dec 706 if g == -4331\ney inc 920 if lb <= 4512\nl inc 858 if c < -968\ntx dec -357 if ey >= 6631\noui inc 344 if znl != -1466\ntx dec 549 if znl > -1466\ntx dec 748 if h > 491\nznl dec 544 if xj >= -332\noqg inc -626 if y > -576\nkq inc -28 if a == 2585\nekl inc -895 if tx == -420\noqg inc 770 if ekl < -2173\ng inc 712 if kq == -5155\ney dec 809 if a > 2578\nznl dec -8 if c >= -972\noui dec 360 if p >= 1580\nl dec 231 if znl != -1992\nhpz dec 307 if l > 443\noqg dec -152 if x <= -4594\ny dec -153 if id >= 1488\noui inc -122 if l < 456\nxj inc -818 if id != 1493\nun inc -819 if a != 2594\nabh dec 518 if ekl < -2169\nznl inc 873 if y < -412\nekl dec -431 if h == 496\nx dec 498 if x > -4595\nehe inc 133 if z > 1093\ntx dec 293 if g != -3619\nkq dec -29 if znl <= -1118\ntx dec 621 if un > -120\np dec 494 if z >= 1089\nh dec -40 if l < 457\nz dec -430 if lb == 4501\ntk dec -339 if kq == -5126\ny inc 616 if oui != 5834\nkq inc -28 if z == 1091\nabh inc 267 if ey < 5808\nhpz dec -100 if h <= 536\np dec 883 if kq < -5120\ntx inc 516 if p >= 699\nl inc 183 if oui != 5846\nkq dec 230 if znl >= -1120\nznl dec 595 if ekl > -1742\noqg dec -408 if g <= -3614\ny dec -796 if c >= -977\nid dec 414 if lb != 4514\nekl inc 845 if abh <= -3685\nc inc 193 if p <= 699\nxj dec -590 if oui == 5842\nz dec 899 if kq <= -5349\nkq dec 616 if kq <= -5365\ng dec 371 if ey == 5815\nlb inc -922 if y <= 1003\nhpz dec 592 if a != 2576\nxj dec -548 if ehe == 603\nlb inc 867 if oqg < -7495\nx inc -162 if l >= 628\nekl dec 926 if un <= -116\ney inc -661 if oui != 5851\nz inc -44 if a != 2588\nkq inc 929 if h >= 529\np dec 373 if oqg != -7496\noqg inc 629 if g >= -3996\nkq inc -667 if a <= 2579\np inc 620 if ekl <= -891\nxj inc -169 if x >= -5249\ntk inc -327 if g > -3996\nh inc 96 if oqg > -6860\nc inc 362 if c != -963\ntk dec -861 if un == -110\nekl dec -765 if x != -5259\na dec 844 if g != -3980\noui dec -549 if l == 631\nc dec 753 if p > 937\na inc 661 if y <= 1001\na dec -315 if oqg < -6853\nznl inc -538 if p == 947\nun inc -894 if tx < -515\nabh inc 958 if a > 2711\nxj inc 806 if tk < 1527\nabh inc -317 if z >= 136\ntk inc 75 if un <= -997\nx inc -171 if a <= 2718\nz inc -339 if ekl >= -139\noqg dec 743 if un == -1004\nznl inc 942 if abh != -3058\ny inc 195 if un != -1014\noqg inc -289 if z > -192\nun dec 253 if un >= -1006\ney dec 426 if hpz < 2542\nehe dec -877 if c >= -1364\nz dec -399 if ey >= 5147\nznl inc 224 if un > -1267\nh dec -1 if x != -5427\noui inc -541 if abh != -3047\nh dec -48 if id <= 1085\noui inc -841 if y >= 1191\nekl inc 880 if xj < 805\nxj dec 804 if z <= 210\nxj dec 91 if h >= 690\ney dec -355 if oqg == -7601\ntx inc -508 if znl > -1089\nxj dec 948 if ekl != 754\np inc 675 if z > 201\nc inc -872 if p < 1624\nun inc -470 if znl <= -1081\noui inc -672 if z >= 202\nc dec -191 if l > 628\np dec -603 if y <= 1196\nun dec 283 if id != 1086\nun inc -942 if znl != -1096\ntk inc 553 if tk < 1604\nl inc -644 if ey < 5515\ny inc 845 if g != -3985\noui dec -883 if un != -2947\nehe dec 449 if p <= 2226\nkq inc -410 if oui > 6052\nhpz dec 97 if ey > 5509\nznl inc -892 if hpz != 2539\noqg dec 585 if znl != -1971\nz inc 257 if tk == 2150\na dec 445 if oui >= 6053\noqg dec -745 if oui == 6061\nekl inc 631 if oui <= 6064\nun dec 401 if znl == -1978\noqg dec 289 if kq < -4835\noqg dec -867 if xj != -954\nh inc -764 if ehe == 1031\ny inc 63 if z < 468\nid inc 750 if tx != -1037\nz dec -142 if a != 2269\nx dec -497 if x >= -5423\nekl inc 27 if x > -5427\nehe inc 458 if kq <= -4829\noqg inc -20 if un > -3355\nl inc -512 if znl != -1982\nehe inc 684 if znl != -1977\nekl dec 834 if x <= -5427\np inc 563 if l == -525\nznl inc 178 if ehe > 2173\ny dec 396 if ehe < 2181\np dec -55 if ey == 5515\nid dec 670 if znl >= -1981\nz inc -718 if lb >= 3581\nc dec 976 if tk < 2152\ng inc -118 if ehe != 2179\nxj dec -150 if x == -5425\nekl dec -332 if xj != -806\nid dec -692 if ekl == 1739"


isDuplicate : List Register -> String -> Bool
isDuplicate registers registerName =
    List.foldl
        (\reg res ->
            if reg.name == registerName || res then
                True
            else
                False
        )
        False
        registers


getRegisterByName : List Register -> String -> Register
getRegisterByName registers name =
    List.foldl
        (\register res ->
            if register.name == name then
                register
            else
                res
        )
        emptyRegister
        registers


isValidCondition : List Register -> String -> String -> Int -> Bool
isValidCondition registers registerName conditionOperator conditionValue =
    let
        register =
            getRegisterByName registers registerName
    in
    case conditionOperator of
        ">" ->
            register.value > conditionValue

        ">=" ->
            register.value >= conditionValue

        "<" ->
            register.value < conditionValue

        "<=" ->
            register.value <= conditionValue

        "==" ->
            register.value == conditionValue

        "!=" ->
            register.value /= conditionValue

        _ ->
            False


incrementByValue : Register -> Int -> Register
incrementByValue register value =
    { name = register.name
    , value = register.value + value
    }


decrementByValue : Register -> Int -> Register
decrementByValue register value =
    { name = register.name
    , value = register.value - value
    }


applyAction : List Register -> String -> String -> Int -> List Register
applyAction registers actionRegisterName action actionValue =
    let
        targetRegister =
            getRegisterByName registers actionRegisterName
    in
    List.map
        (\reg ->
            if action == "inc" && reg.name == targetRegister.name then
                incrementByValue targetRegister actionValue
            else if action == "dec" && reg.name == targetRegister.name then
                decrementByValue targetRegister actionValue
            else
                reg
        )
        registers


getInitialRegisters : List Register
getInitialRegisters =
    let
        puzzleRows =
            String.lines getPuzzleInput

        registers =
            List.foldl
                (\row r ->
                    let
                        register =
                            Maybe.withDefault "" <| List.head <| String.split " " row
                    in
                    if isDuplicate r register then
                        r
                    else
                        List.append r [ { name = register, value = 0 } ]
                )
                []
                puzzleRows
    in
    registers


applyInstruction : List Register -> String -> List Register
applyInstruction registers instruction =
    let
        actionValueList =
            String.split " " <|
                Maybe.withDefault "" <|
                    List.head <|
                        String.split " if " instruction

        conditionValueList =
            String.split " " <|
                Maybe.withDefault "" <|
                    List.head <|
                        List.reverse <|
                            String.split " if " instruction

        ( actionRegister, action, actionValue ) =
            case actionValueList of
                [ a, b, c ] ->
                    ( a, b, Result.withDefault 0 <| String.toInt c )

                _ ->
                    ( "", "", 0 )

        ( conditionRegister, condition, conditionValue ) =
            case conditionValueList of
                [ a, b, c ] ->
                    ( a, b, Result.withDefault 0 <| String.toInt c )

                _ ->
                    ( "", "", 0 )
    in
    if isValidCondition registers conditionRegister condition conditionValue then
        applyAction registers actionRegister action actionValue
    else
        registers



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     let
--         puzzleRows =
--             String.lines getPuzzleInput
--
--         initialRegisters =
--             getInitialRegisters
--
--         updatedRegisters =
--             List.foldl
--                 (\instruction res ->
--                     applyInstruction res instruction
--                 )
--                 initialRegisters
--                 puzzleRows
--
--         maximumRegisterValue =
--             Maybe.withDefault 0 <|
--                 List.maximum <|
--                     List.map .value updatedRegisters
--     in
--     toString maximumRegisterValue
--
--
-- getPuzzleAnswer2 : String
-- getPuzzleAnswer2 =
--     let
--         puzzleRows =
--             String.lines getPuzzleInput
--
--         initialRegisters =
--             List.append getInitialRegisters [ { name = "xxxxxx", value = 0 } ]
--
--         updatedRegisters =
--             List.foldl
--                 (\instruction res ->
--                     let
--                         updatedWithInstructions =
--                             applyInstruction res instruction
--
--                         maximumRegister =
--                             getRegisterByName res "xxxxxx"
--
--                         maximumValue =
--                             Maybe.withDefault 0 <|
--                                 List.maximum <|
--                                     List.map .value updatedWithInstructions
--                     in
--                     List.map
--                         (\rr ->
--                             if rr.name == maximumRegister.name && maximumValue > maximumRegister.value then
--                                 { rr | value = maximumValue }
--                             else
--                                 rr
--                         )
--                         updatedWithInstructions
--                 )
--                 initialRegisters
--                 puzzleRows
--
--         maximumValue =
--             Maybe.withDefault 0 <|
--                 List.maximum <|
--                     List.map .value updatedRegisters
--     in
--     toString maximumValue


getPuzzleAnswer : String
getPuzzleAnswer =
    "6061"


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    "6696"
