module Days.Day7 exposing (getPuzzleInput)

-- module Days.Day7 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (Array)
import Char exposing (..)


getPuzzleInput : String
getPuzzleInput =
    "mmqyju (156) -> rjzvwv, noybkx\n    dvkug (90) -> tbjbz, gxnvl\n    meeiw (95)\n    iaibv (52)\n    ckddz (36)\n    yikfhvr (52)\n    phqiqi (92)\n    ywctcn (38)\n    boofr (332) -> aqiun, zilgfzu\n    zfusug (65)\n    yffcj (90) -> bbmmtud, bqbgocl, kgntkz, mmfwbku, asefoiu\n    velbwcl (432)\n    liori (107) -> fzcts, wgfbd\n    watknc (96)\n    wbpvo (77) -> dtdkt, ixhnyqi\n    mladbjo (27)\n    cimsvsq (69)\n    ugyjqg (10)\n    tmybiz (55)\n    ueheft (12)\n    awweagx (26)\n    zxiqpq (88)\n    atcrb (92)\n    ocauj (95)\n    ayqfub (306) -> drwyz, prssjgo\n    xbeau (76) -> xxshfpr, renhdd\n    tmicb (21)\n    uesefn (59)\n    kbcztr (82)\n    rcssnrj (89)\n    ruahai (23)\n    gjtfdc (27)\n    eknipd (695) -> lyqumu, egjriv, ipnwyh\n    cqlnevp (23)\n    svibl (384)\n    jjvdara (27)\n    kpnjwzl (79)\n    mhtgqj (333) -> jzyfyj, njbqsh\n    mhxpay (200) -> zffpdg, smhctr\n    cinjgkc (11)\n    nvpsm (135) -> yfjtfc, oebjoin, phmpasy\n    qxnfz (29)\n    smpoeov (79) -> wygaxkm, vjjhef\n    dckpb (64)\n    lgsulw (254) -> kmmtdma, luemof\n    sgjljt (23)\n    mjverr (15)\n    kbhig (38)\n    tvranal (153) -> oyegdcw, gjtfdc\n    dresa (218) -> grcpk, uqork\n    kixuhs (88) -> prjag, dnrtq, vltxhu, lupel\n    adooxhb (37)\n    esxbml (69)\n    skgciiy (23)\n    utnwfrl (55)\n    fixda (59)\n    jmwrcxe (88) -> hwvglh, rgiaar, dypjwz\n    radrzr (88)\n    gdbvvx (36)\n    rfowq (266) -> xztwenv, gdbvvx\n    qvily (7)\n    jvegmwc (153) -> mladbjo, jjvdara\n    qesuv (303) -> tculi, lsgvik, boofr\n    xhifoak (6)\n    zkhxn (52)\n    gjaltuo (54) -> gffoyh, mrzmkae\n    taaibzy (209) -> xbbygk, ysqizk\n    lzzeke (24) -> tfdwxe, kvgsfj, lwaoy\n    zspyg (57)\n    qvcnscn (21)\n    pkyos (67)\n    teduvz (61) -> watknc, ibvain\n    oppaock (53)\n    vrlcw (823) -> svibl, upxfo, kzxpedk\n    rmwhlgz (179) -> zjkdtrq, jpshwm, dytikd\n    qjpyu (191) -> ssnkl, cqakc, mentp\n    cxrjgg (25)\n    btmuz (154) -> pnxkdii, fxhtvj\n    ithtabv (50)\n    hjbghmi (45)\n    yxlqjxz (61)\n    huwrhd (92)\n    xgzmr (471) -> yiwuei, kdptwot, wjkdl, ialdmz, nqkbjlh, lkijuws\n    iebero (287) -> honhsr, cehuzkr\n    cqgqm (214) -> ryatef, khuyb, opluk\n    njiwy (19)\n    nqkbjlh (237) -> xhifoak, nkikn\n    wjaav (94)\n    gtmfflw (13) -> cnsemxt, tdmre, wqcyyp\n    gxfqm (9)\n    jccqeca (60) -> yxzvg, hsedh\n    jvmpc (180) -> oiuih, yeojp\n    gzogp (9) -> tzhjol, xwuvr, tjurw, fnecqcx, hovodbo, mjorwvu\n    phkhvmp (127) -> tmicb, kfnox, xuxtbe, qzflerr\n    jirvayi (84)\n    vsuyxah (68)\n    uzcfn (11)\n    jxuvy (128) -> nplxpml, wttkrli\n    ihmflgt (39)\n    efwsj (13)\n    ntdeykb (11)\n    kolxt (195) -> sctwwty, esxbml\n    viofo (72)\n    svugo (32) -> xolvnpy, gjxqx, gtzxxav, njorjq, qpiklvf\n    owjht (58)\n    sfjspc (41) -> jlzxun, gnweaxi, ftloq, xbqsegw\n    bmfcc (48) -> ixmsn, sdosxki, pmwsup\n    bqrvhzi (21)\n    yemke (49) -> hqdcn, jltou, fnjdau, lwemj, eathpcv, xwslnr\n    pmwzrxm (103) -> mumtfo, azokid, cueuqa\n    vnqxpf (30)\n    rkait (96)\n    rtsbu (120) -> isnkzg, ipmyklq\n    tmxbh (363)\n    jfctkmt (60)\n    ihsfpwk (19)\n    lhdgv (59)\n    syefk (45)\n    aglcugi (368) -> iaybgca, fekljc, pxhroue\n    mezpvo (47)\n    olaxe (36)\n    gpudbvp (33)\n    mrzmkae (91)\n    neoyxft (11)\n    rpdrdxo (77)\n    spxqd (24)\n    pjkrgv (64)\n    gcashr (16)\n    ohfpwd (42)\n    dvkjfk (310)\n    fzmzcc (137) -> rzgdz, bptimbu\n    nithd (47)\n    wttkrli (60)\n    kyoopc (167) -> ntdeykb, uzcfn\n    vyitr (23)\n    gggvdzp (65) -> fxjacfb, gxwqiat, trotdqj, ygvnuu\n    nikpljz (97)\n    xolvnpy (22946) -> dfbeg, ajrrm, niuzt\n    zkyvs (76)\n    qkyqkf (38)\n    wdprouh (69)\n    mtpicwi (162) -> lzkcsih, hlcpmj, lzllws\n    vdvwz (92)\n    nplxpml (60)\n    spagr (200) -> fkzarsq, awweagx\n    uezwbls (92)\n    wqmlfzf (98)\n    qubsj (176) -> agnkj, ewbgxj\n    rpijm (71) -> cjszhjz, cbihaff\n    udwhf (1047) -> kolxt, trwpih, oqhuqw, jggkrpf\n    oebjoin (18)\n    zhfpuu (88)\n    uyeeefd (55)\n    asckjlv (4889) -> majzil, mubtpc, wgufuoj, uxlfqru\n    uvokiil (18)\n    lybou (114) -> bsttxpj, ivbkm\n    pmutbr (18)\n    ipmyklq (28)\n    gjxqx (14) -> yruivis, rizjob, qsfwl, asckjlv, sfqwrge, bncdhrm\n    essizn (185) -> tdreqt, ycoeh\n    wcvuu (57)\n    wwdta (85) -> mdpdynj, fdvks, zyufjm\n    vjjvitk (30)\n    frgpbr (21)\n    vkvsku (59)\n    dcdgsj (81)\n    ursswr (50)\n    pasahyc (31) -> tvuey, yosexh\n    nstfuaj (82)\n    lbogwls (82)\n    zzsjca (15) -> sglbby, bkxbja\n    oxipms (2533) -> njfaf, okyya\n    oegjhcg (196) -> tbplngl, kcqxplp\n    qgwyq (292) -> odqodqo, tuuzkn\n    qqckql (88)\n    hnlec (30)\n    lwaoy (89)\n    pjcluy (32)\n    wgfbd (68)\n    rzqtfk (167) -> nggfesp, jmnzios, iecbxj, gijrym\n    kmmtdma (68)\n    jvkpk (14)\n    cedfch (94)\n    rbpdfud (138) -> wqmlfzf, meyihxo\n    rlcbfav (960) -> yqjtia, qycgu, jzpih\n    shscp (146) -> zjovf, rwjupwq\n    remft (188) -> yevgrf, mzvna\n    lwwovy (34)\n    douxy (391) -> ayqfub, pwgtgs, voqlc, xfcaona, inilfk\n    guaulxm (92)\n    fciapx (153) -> hnlec, xlvzg, yjxiv\n    bbozoqx (98)\n    rgicvct (57)\n    cyusmf (904) -> rhazko, imrtnt\n    ebyaofj (169) -> wudjb, uyjoabs\n    xkdkyxu (92)\n    sorhq (198)\n    ymetxqm (21)\n    cbihaff (19)\n    kuzim (130) -> vcbcy, mzozybe\n    gehri (45) -> uikxbgu, zotzrjn\n    ebvlur (31)\n    wormisx (75)\n    tcnrrg (83)\n    mdpwa (76)\n    honhsr (27)\n    qpiklvf (11870) -> weohqnq, oifwih, udamz\n    mjtsrs (153) -> pexdlf, sjrepyz\n    mcqnk (18)\n    zunzpwe (61)\n    hsedh (94)\n    blrgxsb (13)\n    khvwq (93)\n    zrprsn (370) -> tqwxt, eshhfd, jrqnj\n    gxlrkmy (93)\n    mmcebdy (37)\n    ovlnitv (6)\n    dkzlr (38)\n    hrjop (74) -> brtxkgi, vgdjxl\n    efcjat (78)\n    ymjmo (22)\n    gnweaxi (44)\n    fbplv (90)\n    ttldnhl (8265) -> qifwjr, qckol, qjpyu, cyusmf, aglcugi, bkkwt\n    mwkjo (206) -> kgfbft, eqlnvl, uihrkc\n    fuitrtz (89)\n    vpuxpxj (165) -> bkuxrk, lqxevih, eixwwxn\n    onrklke (20)\n    cirsfs (182) -> adckzt, ujgeo\n    emqnw (55)\n    ysseykl (88) -> noxvqga, pmlho, cdlnovn\n    yluell (270)\n    njfaf (69)\n    ydtqhd (174) -> fpmzgvo, ibasy, zoeam, bpboa\n    noybkx (21)\n    hkcuz (126) -> vefasv, cvbnb\n    jcjsn (15)\n    xxikrr (14)\n    jxcxf (14)\n    wleja (43)\n    oyegdcw (27)\n    lqdyln (78)\n    ngpkzb (92)\n    axsupxp (861) -> bpcxrn, jjhqu, fvtboh, emgpu\n    gnovsx (38)\n    kizgz (38)\n    leubrjl (41)\n    eflhino (370) -> qubsj, cqgqm, ftcizt, lkuphpg, tcndbu\n    xlvzg (30)\n    xbqsegw (44)\n    xbbygk (22)\n    rujpx (44)\n    inzafdy (23)\n    hnurp (294) -> aaspu, ncrzjm\n    cvbnb (32)\n    cxuzdyf (180) -> hvfav, lnund\n    xewgja (310)\n    muarank (260) -> yvzuohq, ecbpy\n    pucapcr (35)\n    tpldx (119) -> fyqftv, ttiemo, vjjvitk, xgzja\n    hnszth (13)\n    uajyksv (7) -> avlhpbs, ywzku\n    yuecj (6)\n    jdgbrz (79)\n    cofol (1327) -> zjkxmfh, xniyrk, bqzcmr, gjaltuo, oapztg\n    tkvcp (111) -> jpfbl, dmoexuj, vopoojk, blebnht\n    bbmmtud (186) -> qvcnscn, pomeveh, mflxo\n    lcggy (77)\n    dytikd (8)\n    tqwxt (5)\n    hthizhf (12)\n    zmfeb (96)\n    uaajucq (174) -> khuqo, onnwjy, nmpojs, jzhtpli\n    gppcfr (95)\n    oswptur (15)\n    tculi (344)\n    anvukkl (29)\n    zksug (25)\n    luemof (68)\n    onnwjy (15)\n    eqlnvl (44)\n    ywzku (91)\n    amulani (85) -> kedwhhj, stjjr\n    wxikdvk (29)\n    lkhbcfn (97)\n    cueuqa (69)\n    fzwdnl (139) -> thbbk, kmecjf, mjverr, oswptur\n    bpjtor (125) -> twcrr, ltiabeu, vlbxwof, lycxba\n    emszr (36)\n    lcxllj (59)\n    ihbeh (34)\n    qjqyd (48)\n    nggfesp (18)\n    ugres (102)\n    kkxxua (34)\n    hjwyc (28)\n    meygo (37)\n    twcrr (63)\n    trwpih (297) -> hghnmv, nzygm\n    sphbbz (1161) -> gioryg, scetry, sfjspc, ivpbt, vyufo, valbm, oprfjt\n    dzhvos (51) -> nithd, dleprko, hqvbm, bcmtnt\n    drxxrz (12)\n    igjcv (21)\n    ubwfyx (35)\n    xtuocx (42)\n    kepgi (7) -> ndfkl, lsxavn\n    ujgeo (24)\n    cjusyky (12)\n    ijlsc (35)\n    myhzuy (67)\n    fkzarsq (26)\n    tdmre (66)\n    xponr (68)\n    hrhwxq (23)\n    vhfqi (49)\n    dyhtgng (302) -> wngrd, covjpf, mosbw, ljvrj, jvegmwc, mptzfm\n    scetry (9) -> qvzlvq, eounj, iaibv, zkhxn\n    ivbkm (56)\n    rwjupwq (43)\n    sxppnu (4079) -> tisslxr, hqvoym, ahdgqpm, xpmraw, dghbo\n    zxpxr (35)\n    lnund (98)\n    bpcxrn (146) -> poslxf, ryclgvc, vgdjz\n    uxlfqru (643) -> mhxpay, taslihw, ttqrjz\n    bcmtnt (47)\n    iodopqk (610) -> zhffwjr, sykqu, btmuz, cirsfs\n    gbmobi (97)\n    xutqsde (18)\n    opyjeyu (79)\n    ydwug (112) -> fbplv, clvvt, pnyyag\n    aemufzz (246) -> tatyvy, rujpx\n    dkasko (86) -> nstfuaj, vmcib\n    xgytt (377)\n    zjurdqp (115) -> adooxhb, meygo\n    jpfbl (52)\n    ebjlbr (112)\n    rhazko (20)\n    ajrrm (7311) -> yemke, ugmfrt, crnvz\n    zrltc (183) -> jdenl, anvukkl, wxikdvk\n    urliam (69)\n    nwjosw (198) -> iilxm, cvmjs, jgzuz\n    mavpqd (367) -> ymetxqm, izdutmt, ptvkpk\n    vbsku (35)\n    ljvrj (183) -> drxxrz, ueheft\n    jrqnj (5)\n    biibrbq (6792) -> gzogp, udwhf, vfepai\n    escjt (82)\n    zokte (31)\n    psjyx (46)\n    ysqizk (22)\n    ihxtg (41)\n    jzpih (127) -> igjcv, gvbxg, umkwa\n    rqswk (189) -> ohfpwd, usdonaj\n    llsqcnz (23)\n    mosbw (21) -> tenewcj, losxko\n    ukvdvgo (78)\n    jlzxun (44)\n    wounsqk (99)\n    arsrlmc (66) -> putprdw, pgfgtwj\n    hxnea (302) -> gcashr, wwmta\n    pxhroue (98) -> diccfps, mezpvo\n    mmgep (155) -> yscvt, vdxvll\n    lsgvik (65) -> jgqxt, yztcfw, jmnxhqh\n    wjkdl (179) -> rwtyr, zxpxr\n    yfkfk (90) -> xvtvomy, pkktbxs\n    tucemlh (82)\n    zsvyve (2401) -> lokxju, oppaock\n    gvbxg (21)\n    izdutmt (21)\n    dutfal (59)\n    qqlkwr (59)\n    pmwsup (74)\n    xgzja (30)\n    epflhcq (314) -> pxqgvjs, ebvlur\n    snqyc (90)\n    jgzuz (13)\n    poslxf (73)\n    wfzkd (6)\n    kbcjy (81)\n    fnecqcx (231) -> yuerovj, kbcztr\n    wgmxwy (78) -> kysof, zrqkic, qytnj, qqvrhv\n    ezwrgwg (23)\n    fteop (38)\n    qimvddh (99) -> qjqyd, iyytgk, ppepf\n    lycxba (63)\n    cjszhjz (19)\n    nbksews (75) -> fpdttlv, ygjbwu, vlhrcsh, sdawsdp, lzzeke\n    sfqwrge (948) -> pdyhl, njzaj, uaztc, hpthw, xgzmr\n    upxfo (204) -> akqoae, fgihxex\n    wterb (93)\n    nxvhzm (75)\n    xrffbj (88)\n    jpshwm (8)\n    imnmqmc (1056) -> crghfz, rsygg, fpimfx, icurk, infjgg, drxkj\n    errywn (2003) -> jklwqzz, blzatj, uiqegu\n    bqgxg (14)\n    iollvjh (75)\n    bwtwoy (46)\n    khaneu (35) -> spuzkk, sheuujc\n    aaspu (41)\n    nzmzrf (63)\n    etgpwm (22)\n    kwilox (41) -> cedfch, wjaav\n    asefoiu (249)\n    sglbby (94)\n    mnchjf (65) -> cimsvsq, grmps\n    lzllws (90)\n    kvmxpmx (93)\n    ectqv (37) -> rmbnnq, fuvary\n    amauas (34)\n    gymdygg (26) -> zmpsuwb, wonxy, lqdyln, efcjat\n    tzespqz (56)\n    rkotan (72) -> gumtctd, snqyc\n    chtiq (89)\n    oflkits (88)\n    zjpzq (94) -> bskomwv, ythizc, pucapcr, ubwfyx\n    rbozm (214) -> qzxsz, qvily\n    otgvzj (194) -> sygrs, gxlrkmy\n    jzhtpli (15)\n    tfdwxe (89)\n    ialdmz (12) -> gznay, jdgbrz, tcvrov\n    dleprko (47)\n    kgfbft (44)\n    iyytgk (48)\n    jcjqr (99)\n    smlnw (376)\n    uqork (26)\n    hduix (55)\n    sbbpewr (64) -> nkohugb, qfrgkwt\n    njpyn (834) -> npqwie, sbbpewr, nvqjado\n    mhhfovk (1721) -> camcas, fzwdnl, ujacw\n    wmskqd (31)\n    bpboa (44)\n    udamz (45) -> sitbr, cofol, zsvyve, errywn, sizeg, thqkly, ccqhl\n    wfsovdl (47)\n    jzlmges (237)\n    dnacpie (61) -> ngadrj, gedohd, yuvmlq, klmedvh, aende, tkvcp\n    fdoszd (97)\n    ajkxrcl (71) -> ykbvkc, escjt, yolrl, kuoluj\n    kiqjb (89) -> whiwt, bdkcdaq\n    yqgwle (31)\n    wnykty (53)\n    kfnox (21)\n    khuyb (6)\n    fljico (212)\n    vzhdg (78)\n    qqqxi (88)\n    tmnklf (982) -> hxnea, wwdta, aemufzz, rbpdfud\n    axnnpf (73)\n    ijcvtep (41)\n    ihcolp (70)\n    vefasv (32)\n    pruqcvk (34)\n    agnkj (28)\n    fuxnvo (33) -> ngpkzb, xkdkyxu\n    ejqqxk (75)\n    afzkp (83)\n    prssjgo (13)\n    rzgdz (46)\n    pzxqe (139) -> zokte, wmskqd\n    cmgfqkb (48)\n    xwdlxg (178) -> qpfup, wnykty, vwlcnv, vjzph\n    sizeg (2371) -> lwwovy, amauas, krcdkw, kkxxua\n    lnhrx (258) -> isceom, bwtwoy\n    mentp (185) -> gpudbvp, ljvipn\n    njimb (15)\n    hxzqgfl (76)\n    giagung (52)\n    qzxsz (7)\n    egbjx (84)\n    zrqkic (28)\n    kzwcue (81)\n    iilxm (13)\n    qckol (416) -> mnkholz, hrobopm, rtsbu\n    tzhjol (278) -> ihmflgt, jvnks, iefgdb\n    ecbpy (85)\n    okyya (69)\n    aealnl (63)\n    gnetslx (58)\n    jvaqkq (56) -> xgytt, mkwoc, mtwvvup, cbodyg, llajkfm, bpjtor\n    mfgpyyw (47)\n    pohvscs (81)\n    nmawxdq (35)\n    xhtorci (46)\n    wajjyev (119) -> mmkbh, lcggy\n    bdovfqj (60)\n    klmedvh (319)\n    ercgkci (81)\n    vdcnit (214) -> zxiqpq, oflkits\n    vvqpt (66)\n    nqwkb (98)\n    hqdcn (205) -> wiwrw, jgnvooj, wtsgud\n    fbhzkoh (32) -> afzkp, knbeerh\n    sgygf (50)\n    aklxi (211) -> pvrocec, lstxl\n    dfbeg (77) -> dnacpie, xgjyuie, ygnxu, gpsaq, vrlcw, xnzmf, tongu\n    jltou (358)\n    ptvkpk (21)\n    camcas (129) -> qubakh, tromme\n    iunpq (1373) -> ruusx, hrjop, lybou\n    eounj (52)\n    oiuih (85)\n    uiakb (28)\n    imrtnt (20)\n    ylzdc (57)\n    chsgrkx (90)\n    vgdjz (73)\n    nnbcnzu (1184) -> pedrwzo, unkckgx, sklzg\n    bhgcvz (50)\n    wtioxkx (90) -> fgoqtbj, zunzpwe, yxlqjxz\n    fvtboh (68) -> hrwcuqh, wjccpg, wounsqk\n    thqkly (1735) -> krldk, gdndx, mmgep, qwrruob\n    cqcqid (21)\n    buaue (1110) -> arpzsz, ueyxaa, iowckgn\n    gwqvxp (38)\n    ukjzi (26)\n    jdooxot (158) -> zkbdn, tshems\n    vjxqtpi (95)\n    zyufjm (83)\n    vlhrcsh (139) -> gnovsx, zwpqdpp, qkyqkf, hhgrgoa\n    gftxf (79)\n    vywee (45)\n    wlrdp (58)\n    eebyw (84)\n    cafcfnl (19) -> ntnqvtk, uezwbls\n    ogltzt (12)\n    saifkw (11) -> rkait, srozw\n    ruusx (28) -> jcjqr, bchpnd\n    ndfkl (91)\n    brjpqy (168) -> zfusug, uagtgt, htzdq\n    zmpsuwb (78)\n    sklzg (63) -> wvrrwfs, kpnjwzl, gftxf, unrxrxg\n    mhmbmve (75)\n    jhztf (93)\n    rdiysu (18)\n    yuvmlq (229) -> cadkdj, syefk\n    scurl (906) -> oymgkey, otgvzj, dojoi\n    kdkng (23)\n    akqoae (90)\n    nigxeuz (18)\n    pwgtgs (194) -> ykiurcc, mapgeoe\n    vgdjxl (76)\n    sgbzm (108) -> wwutk, licetbw, nwjosw, jzlmges, qlfars, gggvdzp\n    julhx (72)\n    lfbbsay (63)\n    iaybgca (129) -> frgpbr, mvqoekw, vmebh\n    tunuzcn (17) -> nquzdn, qzohrj, rsmvde, thsdq\n    tbtzwz (153) -> wleja, pckcqy\n    vxrdwe (15)\n    fzuomz (27)\n    uyjoabs (37)\n    imcujsr (92) -> bdovfqj, tnmziio\n    bipgvd (173) -> nmawxdq, tbnuh\n    mubtpc (85) -> juifyyw, uxpblf, sqbnfxf\n    ghhfd (60)\n    noxvqga (98)\n    wwutk (127) -> mbxchx, tmybiz\n    njorjq (31504) -> ppgcgz, tdqqjpg, zuhfs, lyxqyl\n    tzypui (85)\n    oopqud (261) -> lxkwe, urvedm\n    rklqa (59) -> nwsecpl, xtnyr\n    pnyyag (90)\n    igaui (84)\n    thbbk (15)\n    unrxrxg (79)\n    gcdbb (74)\n    urgfd (48)\n    srwgf (31)\n    phmpasy (18)\n    kcqndc (60)\n    faendwk (83) -> kcqndc, jfctkmt\n    rizjob (6366) -> eknipd, mhhvcg, zparvpi\n    aaalewd (95)\n    mzymfht (22)\n    silwij (75)\n    xtnyr (90)\n    lxkwe (6)\n    nquzdn (46)\n    szyzmuw (28)\n    kkidtmk (13)\n    bxeil (81)\n    bsttxpj (56)\n    jhpiym (94)\n    zjkxmfh (236)\n    sultgf (90) -> uyeeefd, hduix, zrofm, zqdnix\n    hturdef (24)\n    jimcygz (75)\n    xlxroru (6)\n    nlirga (41)\n    ypxvo (40) -> nqwkb, bbozoqx, jvwlo, yktkkr\n    wudjb (37)\n    blebnht (52)\n    bkkwt (335) -> khaneu, zzsjca, rmwhlgz\n    pdqvd (64)\n    whiwt (64)\n    jiqrrq (35)\n    tbjbz (93)\n    pedrwzo (309) -> zwjdka, jiqrrq\n    zoeam (44)\n    rmqmme (97)\n    awfrk (25)\n    majzil (784) -> fzmzcc, bnawjt, kwilox\n    qsfwl (63) -> rlcbfav, iodopqk, njpyn, kwymyn, sgbzm, nbksews, eflhino\n    bnawjt (137) -> hrhwxq, ybtsie, inzafdy, ezwrgwg\n    usdonaj (42)\n    mjvxc (188) -> wyiofd, sgygf, ursswr\n    yefht (196) -> xutqsde, pmutbr\n    smhctr (38)\n    qsnwd (65) -> cxuzdyf, qtgxg, smlnw, hnurp, epflhcq, kixuhs\n    cjixx (241) -> wdprouh, urliam\n    zdtby (961) -> dtfayu, qfuqfre, yaqfv, fuxnvo, kiqjb\n    iovig (22)\n    zrofm (55)\n    dybapm (159) -> jtxkj, utnwfrl, cdzfql, emqnw\n    qtgxg (376)\n    oxpphmz (1319) -> uylmxqo, hufovxb, ugres\n    uzpxmf (198)\n    vchfk (23)\n    fvcbh (233) -> xsauoti, joruazf, ijlsc\n    xvmstn (64)\n    nvxbdd (6)\n    zauos (107) -> uniifn, xponr\n    yvzuohq (85)\n    kvqrdbr (15)\n    uikxbgu (97)\n    wgufuoj (667) -> ovzoej, pzxqe, pasahyc, tunuzcn\n    ecsdihr (93)\n    kyvqypb (16)\n    eathpcv (256) -> tugui, psdcdbm\n    iclrood (121) -> vyitr, qynklua, aahmp\n    uiycup (59)\n    ttiemo (30)\n    zhffwjr (89) -> casskdk, wfsovdl, umzrb\n    jddjjw (21) -> jvaqkq, mhhfovk, flsxmc, tmnklf, lazvv, cfxwzf\n    yvicgh (73)\n    hrwcuqh (99)\n    yypsdby (41)\n    sgnexg (96)\n    xxdnojb (92)\n    mbymo (81)\n    bwujye (83)\n    covjpf (61) -> qiediji, yvicgh\n    xxelf (34)\n    juihbkt (94)\n    gludbju (12)\n    oqhuqw (90) -> ercgkci, ogrpc, bxeil\n    bqzcmr (108) -> pjkrgv, rfooa\n    mumtfo (69)\n    dpbywy (49)\n    fpimfx (119) -> skgciiy, cqlnevp\n    ygnxu (160) -> bpctu, siykhg, aklxi, brjpqy, tmxbh\n    tcvrov (79)\n    zncyr (999) -> ezxakj, injvyeb, whboh\n    qzflerr (21)\n    enjhfeg (13)\n    eixwwxn (29)\n    ryatef (6)\n    bkxbja (94)\n    eeuykqk (47)\n    ivinyhh (6)\n    swshl (25)\n    mapgeoe (69)\n    jljjh (37)\n    fuvary (75)\n    njbqsh (33)\n    ztfziz (56) -> nikpljz, gbmobi\n    kikqp (97)\n    uwmpw (97)\n    hqvoym (1226) -> jccqeca, xbeau, jxuvy\n    isnkzg (28)\n    wsstaru (12)\n    edsdrz (59)\n    sqbnfxf (440) -> guuvcz, wniti\n    sviek (24)\n    cmdjxza (76)\n    putprdw (73)\n    dnrtq (72)\n    cuvpk (97)\n    qghnwdf (94) -> jirvayi, eebyw, igaui, nklype\n    gffoyh (91)\n    wumlot (221) -> neoyxft, cinjgkc\n    rfooa (64)\n    yevgrf (32)\n    pkuggs (131) -> fdplo, tzespqz\n    vaexiu (1581) -> ymjmo, iovig\n    rehpie (86) -> liori, zauos, ebyaofj, pbqrv, fciapx, bipgvd\n    vcumw (94)\n    uobgk (338) -> adygspa, psjyx\n    gtvsym (18)\n    wvrrwfs (79)\n    pckcqy (43)\n    qymuwz (74)\n    cfxwzf (1634) -> mlvywui, kuzim, rbozm\n    hrwhc (51) -> jhpiym, juihbkt\n    lazvv (1589) -> pkuggs, wumlot, qimvddh\n    ykbvkc (82)\n    tbplngl (18)\n    sjrepyz (60)\n    tdreqt (54)\n    jvlrpy (7)\n    zwrwngq (203)\n    valbm (65) -> cmdjxza, tzcosab\n    zfkfc (856) -> tbtzwz, dzhvos, tcewj, gehri, ixcueuk\n    qrncpfb (463) -> trrrswp, mjtsrs, ziiojfl\n    hsnkmd (77)\n    ttqrjz (86) -> ddmyid, gppcfr\n    lnddtya (60)\n    ghzfclb (929) -> aokguyj, shscp, zzjap\n    cvmjs (13)\n    tongu (778) -> ajkxrcl, hjsyte, mhtgqj\n    amwlt (102) -> putxfkb, edswm\n    ixcueuk (181) -> kgjzt, qxnfz\n    jvnks (39)\n    kzxpedk (72) -> udiibbj, izvxax, ymnqdi, ukvdvgo\n    jmnzios (18)\n    aglfaj (78)\n    qqfxsbl (56)\n    omivhf (24)\n    mkjdh (62) -> zksug, squxhq\n    ogilk (28)\n    drxkj (39) -> atjgje, lfbbsay\n    lcltlz (90) -> dmobhqz, lelwu\n    exyceo (81)\n    paguj (212) -> njiwy, ihsfpwk\n    odqodqo (70)\n    umzrb (47)\n    yosexh (85)\n    bchpnd (99)\n    wngrd (115) -> fpzvpx, xhtorci\n    hjlabl (56)\n    nrqmk (35)\n    kdptwot (195) -> gtvsym, svmplb, pnbyuu\n    injvyeb (112)\n    llajkfm (277) -> bhgcvz, cpjwxir\n    cbodyg (85) -> qvpit, jlonsf, axnnpf, fmdmn\n    dojoi (80) -> jimcygz, mhmbmve, wormisx, ejqqxk\n    tcewj (125) -> rgicvct, wcvuu\n    kvgsfj (89)\n    ythizc (35)\n    mnxqlwj (149) -> srwgf, pqhdp\n    cpjwxir (50)\n    iwvzne (85) -> silwij, ecilwqw, nxvhzm, iollvjh\n    nnpndet (54)\n    kuoluj (82)\n    fzcts (68)\n    xerinl (15)\n    mvacic (6) -> tqxwy, dckpb, dlksv\n    tisslxr (824) -> ysseykl, ydwug, zoawdu\n    fssxj (82) -> vgxptd, myhzuy, pkyos, rclvfez\n    yolrl (82)\n    ogrpc (81)\n    tzcosab (76)\n    vdbcedp (92)\n    flsxmc (2200) -> qqlkwr, knayoo\n    rfxjtuw (93)\n    njfzhmg (45)\n    howjlo (78)\n    wbftdq (85) -> dutfal, lcxllj\n    brtxkgi (76)\n    wspsxh (211)\n    ibasy (44)\n    whboh (88) -> fawih, hthizhf\n    weohqnq (6219) -> sibzbaw, gaijq, oxpphmz, cdbqrv, vaexiu, ghzfclb, dlgyd\n    svmplb (18)\n    nglzp (39)\n    sctwwty (69)\n    gdndx (193)\n    lgqhttl (323) -> hzmiprs, yqgwle\n    yktkkr (98)\n    zzjap (88) -> mpgup, zeohg\n    uylmxqo (38) -> pjcluy, bqpjwai\n    xxshfpr (86)\n    vgxptd (67)\n    kgpoyb (157) -> llowph, gnetslx\n    vspbcnk (236) -> fvyctke, nrqmk, vbsku\n    iowckgn (75)\n    zstxoet (85)\n    zjkdtrq (8)\n    ddmyid (95)\n    zeohg (72)\n    wwmta (16)\n    ewbgxj (28)\n    urvedm (6)\n    lkijuws (229) -> lqzhrg, ugyjqg\n    mzvna (32)\n    yiwuei (249)\n    htzdq (65)\n    tnmziio (60)\n    crghfz (37) -> pdqvd, xvmstn\n    llocrvp (9)\n    oprfjt (171) -> gbwuf, otipnbc\n    umkwa (21)\n    ustmeld (13)\n    pomeveh (21)\n    squxhq (25)\n    wbbus (72)\n    rclvfez (67)\n    hevef (37)\n    lsxavn (91)\n    bqzpg (90)\n    fdvks (83)\n    tatyvy (44)\n    hufovxb (54) -> spxqd, hturdef\n    wniti (11)\n    fxjacfb (43)\n    nmpojs (15)\n    lbmqte (298) -> zebtnox, ustmeld, kkidtmk, enjhfeg\n    cnsemxt (66)\n    izvxax (78)\n    cnafwov (93)\n    iefgdb (39)\n    ivpbt (217)\n    cdlnovn (98)\n    gxnvl (93)\n    ziiojfl (155) -> lhdgv, vkvsku\n    pnbyuu (18)\n    pnxkdii (38)\n    nlzqs (48)\n    mnkholz (54) -> ymfxsdp, lqdrs\n    cehuzkr (27)\n    lnfyg (95)\n    vmcib (82)\n    losxko (93)\n    mlvywui (30) -> zyeqj, kmrsi, vvqpt\n    czrbivk (29)\n    avufwe (59)\n    iecbxj (18)\n    mhxka (25)\n    xuxtbe (21)\n    skcmxwu (72)\n    pkmya (47)\n    qiediji (73)\n    gzldofv (32)\n    rgiaar (34)\n    vmcicx (94)\n    zwpqdpp (38)\n    qwrruob (133) -> jcjsn, xerinl, czzvje, njimb\n    lwemj (6) -> rgkzdr, qqqxi, uypwb, radrzr\n    oymgkey (354) -> blrgxsb, pfamjeh\n    tykkgvz (14) -> wterb, kvmxpmx, ecsdihr\n    zffpdg (38)\n    gznay (79)\n    yhbpsay (186) -> tcgjhh, leubrjl, ihxtg, ijcvtep\n    nvqjado (204) -> jvkpk, omzye\n    lstxl (76)\n    tshems (16)\n    zqdnix (55)\n    hefczgn (50) -> phqiqi, atcrb\n    uagtgt (65)\n    ssnkl (95) -> aglfaj, jtqcbjx\n    zyeqj (66)\n    pbqrv (75) -> qqfxsbl, jijzbp, gdvydrc\n    jbcaxyl (54)\n    otlvpiq (46) -> velbwcl, ypxvo, qgwyq, mtpicwi\n    krldk (97) -> akyffva, nlzqs\n    knayoo (59)\n    meyihxo (98)\n    zjovf (43)\n    opluk (6)\n    lqzhrg (10)\n    nnayovj (268) -> wxnwn, stpwv, gymdygg\n    revfs (62)\n    kssnbr (63) -> llsqcnz, kdkng\n    qfuqfre (217)\n    naheh (39)\n    jzyfyj (33)\n    rvzug (124) -> jbcaxyl, nnpndet\n    hdkyjhw (42)\n    xpmraw (1409) -> xulssc, ectqv, votqgct\n    llowph (58)\n    jmnxhqh (93)\n    ahdgqpm (833) -> dybapm, crlyq, cjixx\n    pqhdp (31)\n    kmecjf (15)\n    jggkrpf (309) -> yuecj, nvxbdd, xlxroru, wfzkd\n    fgihxex (90)\n    gaijq (675) -> jdooxot, hkcuz, wgmxwy, iclrood, jmwrcxe\n    yruivis (2760) -> oxipms, ggpau, sphbbz\n    dnomd (92)\n    dymsh (63)\n    ygjbwu (235) -> hbnjvi, uiakb\n    jmpqot (93)\n    lqdrs (61)\n    sitbr (57) -> fssxj, yhbpsay, jvmpc, lnhrx, ydtqhd, lbmqte, dmxqneb\n    nkikn (6)\n    trrrswp (95) -> rcssnrj, chtiq\n    qynklua (23)\n    jdenl (29)\n    qbvlzq (77)\n    yvpvvx (84)\n    huide (45)\n    cadkdj (45)\n    bcyxwt (62)\n    dlgyd (625) -> lzgjxpi, paguj, dkasko, pxkqb\n    atjgje (63)\n    uiqegu (6) -> gqzlx, pohvscs\n    wqcyyp (66)\n    evauuqp (23) -> rfowq, gwaym, mwkjo, fvcbh, mjvxc, bhcdq\n    irmrw (521) -> vspbcnk, iebero, eshrket\n    dtdkt (65)\n    mpgup (72)\n    ppepf (48)\n    kxegssv (22)\n    ljvipn (33)\n    azokid (69)\n    ovxnqnd (96) -> lgsulw, xwdlxg, vfkff, rsidt, vdcnit\n    gioryg (77) -> mldtvex, ihcolp\n    gdvydrc (56)\n    cunseqy (38)\n    itnut (161) -> flcth, hjlabl\n    psfpl (38)\n    hmkoeo (139) -> gzldofv, dteqv\n    kptyuf (74) -> opyjeyu, xqeqnpv\n    vdxvll (19)\n    kwymyn (702) -> dvkug, ndjbiq, kykqehq\n    unkckgx (201) -> fuitrtz, atbdhm\n    rfmuffd (132) -> fixda, uesefn\n    knbeerh (83)\n    sheuujc (84)\n    qlfars (161) -> dkzlr, kbhig\n    uaourd (48)\n    fmdmn (73)\n    wlauod (252)\n    ppgcgz (2965) -> dusyrs, bblhcmt, otlvpiq\n    nhhqfzk (38)\n    rabaw (68)\n    casskdk (47)\n    fekljc (24) -> yvpvvx, egbjx\n    kgjzt (29)\n    arpzsz (27) -> omivhf, sviek\n    vlbxwof (63)\n    zfzpy (28)\n    wtsgud (51)\n    thsdq (46)\n    kmrsi (66)\n    dmoexuj (52)\n    gxwqiat (43)\n    ndjbiq (276)\n    bqpjwai (32)\n    licetbw (145) -> ruahai, yzrlkj, vchfk, sgjljt\n    hzoqij (174) -> cjusyky, ogltzt\n    ltgylh (18)\n    xnzmf (1127) -> arsrlmc, fljico, imcujsr, soutui\n    jgqxt (93)\n    omzye (14)\n    yaeji (96)\n    lokxju (53)\n    mkwoc (377)\n    vjycok (33)\n    bblhcmt (1015) -> teduvz, mkcxutj, taaibzy\n    wzfzy (95)\n    yjxiv (30)\n    ixmsn (74)\n    vopoojk (52)\n    wzjwo (145) -> kxegssv, mzymfht, etgpwm\n    sdosxki (74)\n    lluca (96)\n    mflxo (21)\n    soutui (60) -> cunseqy, akunww, nhhqfzk, fteop\n    emgpu (217) -> jljjh, bawyt, mmcebdy, hevef\n    zuhfs (3655) -> irmrw, dyhtgng, rehpie\n    johqjt (26)\n    ygvnuu (43)\n    orozsek (78)\n    xsauoti (35)\n    ncrzjm (41)\n    pxqgvjs (31)\n    vcbcy (49)\n    bpctu (39) -> kfbxhd, dcdgsj, kzwcue, tuxmvw\n    vwtpihe (270)\n    qytnj (28)\n    gwaym (47) -> rmqmme, kikqp, lkhbcfn\n    wfkbot (92)\n    aqiun (6)\n    vfepai (2052) -> rpijm, smpoeov, kssnbr\n    ggpau (91) -> mavpqd, vtthqum, qghnwdf, uobgk, muarank, cgldm\n    mkcxutj (199) -> mcqnk, ltgylh, nigxeuz\n    nrbka (85) -> giagung, yikfhvr\n    kykqehq (90) -> khvwq, jmpqot\n    ccisqhk (36)\n    xvqpfd (81)\n    rgkzdr (88)\n    xulssc (7) -> vywee, njfzhmg, hjbghmi, huide\n    etrye (68) -> bwujye, tcnrrg\n    mptzfm (131) -> kauaro, gwqvxp\n    zilgfzu (6)\n    qvzlvq (52)\n    yscvt (19)\n    lqxevih (29)\n    tugui (51)\n    qzohrj (46)\n    oifwih (13748) -> qrncpfb, czwja, nnayovj\n    khuqo (15)\n    darha (47)\n    fvyctke (35)\n    egjriv (228) -> kvqrdbr, vxrdwe\n    mzozybe (49)\n    juifyyw (74) -> cuvpk, fdoszd, uwmpw, qqbjpw\n    mldtvex (70)\n    yuerovj (82)\n    qifwjr (65) -> tykkgvz, ghfsfzv, essizn\n    ftcizt (36) -> oieio, hzmzm\n    oapztg (14) -> awhtfnb, qymuwz, plfmb\n    renhdd (86)\n    yfjtfc (18)\n    qfrgkwt (84)\n    dmxqneb (65) -> vjxqtpi, ocauj, meeiw\n    akyffva (48)\n    iwvjsf (21)\n    mmkbh (77)\n    qvpit (73)\n    pexdlf (60)\n    wygaxkm (15)\n    sibzbaw (204) -> cafcfnl, faendwk, zwrwngq, mnchjf, saifkw, wbftdq, hmkoeo\n    ipnwyh (81) -> edsdrz, pqciwb, uiycup\n    bqbgocl (85) -> rtbipng, yypsdby, nlirga, bgprkt\n    mjorwvu (341) -> uvokiil, svcfwb, yqvqkjj\n    ngadrj (143) -> qqckql, xrffbj\n    putxfkb (5)\n    dmobhqz (81)\n    guuvcz (11)\n    pqciwb (59)\n    hovodbo (251) -> ibvrqj, oxshhlc\n    kysof (28)\n    hwvglh (34)\n    crlyq (51) -> zhpbfcb, vdmpy, lbogwls, tucemlh\n    mbxchx (55)\n    ymnqdi (78)\n    yxzvg (94)\n    stjjr (52)\n    bgprkt (41)\n    pnvym (58)\n    fyxeenq (25)\n    eshhfd (5)\n    adygspa (46)\n    zhpbfcb (82)\n    mhhvcg (83) -> sorhq, hzoqij, mvacic, fbhzkoh, uzpxmf, cmyrw, mmqyju\n    vwlcnv (53)\n    ifylycs (78)\n    hrobopm (136) -> tzupdgb, onrklke\n    vgxaajp (88)\n    lgowj (58)\n    uypwb (88)\n    ghfsfzv (293)\n    otipnbc (23)\n    gwlzolt (50)\n    rtlvfb (74)\n    pvrocec (76)\n    vdmpy (82)\n    grmps (69)\n    jvwlo (98)\n    stpwv (238) -> fyxeenq, mhxka, awfrk, cxrjgg\n    gboqva (31) -> chsgrkx, bqzpg\n    hpthw (805) -> oegjhcg, iriepoo, rvzug, kptyuf, yefht\n    rsygg (81) -> xtuocx, hdkyjhw\n    vfkff (336) -> fzuomz, xbgyvu\n    nklype (84)\n    oieio (98)\n    fpzvpx (46)\n    dndusk (349) -> pzpybas, rdiysu\n    njzaj (40) -> lgqhttl, zrprsn, iwvzne, ohixl, dndusk\n    eeucvf (58)\n    jlonsf (73)\n    tuuzkn (70)\n    zoawdu (94) -> ongsjaf, zmfeb, sgnexg\n    xwslnr (210) -> rtlvfb, gcdbb\n    kfbxhd (81)\n    plfmb (74)\n    ixhnyqi (65)\n    jjhqu (365)\n    pzxhsq (25)\n    bkuxrk (29)\n    fnjdau (222) -> vsuyxah, rabaw\n    qycgu (96) -> mfgpyyw, darha\n    ccqhl (1886) -> tvranal, cjzstd, wbpvo\n    ohixl (353) -> kyvqypb, boqtus\n    tuxmvw (81)\n    ycoeh (54)\n    prjag (72)\n    hvfav (98)\n    tvuey (85)\n    gpsaq (1408) -> amulani, kepgi, kyoopc\n    aende (88) -> hsnkmd, qbvlzq, rpdrdxo\n    lupel (72)\n    hqvbm (47)\n    sygrs (93)\n    gbwuf (23)\n    wyiofd (50)\n    yzrlkj (23)\n    tjurw (23) -> rfxjtuw, zujwuu, jhztf, cnafwov\n    zwjdka (35)\n    kcqxplp (18)\n    gtzxxav (8936) -> sxppnu, jddjjw, biibrbq, ttldnhl\n    hpboonp (33)\n    cdzfql (55)\n    infjgg (109) -> szyzmuw, zfzpy\n    nkohugb (84)\n    eemxdkb (76)\n    dusyrs (1024) -> ztfziz, pxpuiaz, rfmuffd\n    nwsecpl (90)\n    sdawsdp (6) -> aaalewd, wzfzy, lnfyg\n    dypjwz (34)\n    aahmp (23)\n    grcpk (26)\n    zujwuu (93)\n    wiwrw (51)\n    cgldm (406) -> gludbju, wsstaru\n    kedwhhj (52)\n    rsidt (66) -> xvqpfd, kbcjy, exyceo, mbymo\n    tcndbu (96) -> ihbeh, flyaq, pruqcvk, xxelf\n    srozw (96)\n    tcgjhh (41)\n    rtbipng (41)\n    lyqumu (84) -> pnvym, owjht, eeucvf\n    aokguyj (88) -> skcmxwu, viofo\n    hjgfxun (29)\n    ezxakj (112)\n    svcfwb (18)\n    yaqfv (217)\n    hzmzm (98)\n    lyxqyl (2947) -> yffcj, zncyr, buaue, qesuv\n    uxpblf (214) -> ehttqe, cleda, revfs, bcyxwt\n    ehttqe (62)\n    dghbo (59) -> itnut, oopqud, gmtkf, kgpoyb, wtioxkx, wajjyev, rqswk\n    ntnqvtk (92)\n    yeojp (85)\n    gmtkf (126) -> pmjoye, dpbywy, vhfqi\n    fpmzgvo (44)\n    rsmvde (46)\n    hghnmv (18)\n    lkuphpg (48) -> dnomd, vdvwz\n    inilfk (282) -> swshl, pzxhsq\n    ftloq (44)\n    hbsdlm (26)\n    lelwu (81)\n    qqvrhv (28)\n    czwja (87) -> fqhegd, rzqtfk, tpldx, hrwhc, rklqa\n    tenewcj (93)\n    iriepoo (88) -> wbbus, julhx\n    flyaq (34)\n    jtxkj (55)\n    kauaro (38)\n    dteqv (32)\n    ibvain (96)\n    isceom (46)\n    fpdttlv (249) -> iwvjsf, bqrvhzi\n    ibvrqj (72)\n    avlhpbs (91)\n    zotzrjn (97)\n    vjzph (53)\n    edswm (5)\n    bhcdq (62) -> vdbcedp, xxdnojb, wfkbot\n    hhgrgoa (38)\n    yqvqkjj (18)\n    mdpdynj (83)\n    dtfayu (217)\n    gedohd (263) -> ogilk, hjwyc\n    uihrkc (44)\n    bskomwv (35)\n    lzgjxpi (66) -> huwrhd, guaulxm\n    kihst (30)\n    npqwie (56) -> vgxaajp, zhfpuu\n    jijzbp (56)\n    wonxy (78)\n    hjsyte (207) -> urgfd, mfdpgv, uaourd, cmgfqkb\n    vmebh (21)\n    ueyxaa (57) -> gxfqm, llocrvp\n    hzmiprs (31)\n    mvqoekw (21)\n    mmfwbku (60) -> dymsh, nzmzrf, aealnl\n    ltiabeu (63)\n    uniifn (68)\n    trotdqj (43)\n    pdyhl (699) -> wzjwo, phkhvmp, gboqva, mnxqlwj, gtmfflw, wspsxh\n    uaztc (1629) -> amwlt, mkjdh, ebjlbr\n    pmlho (98)\n    zparvpi (713) -> zjurdqp, uajyksv, nrbka, nvpsm\n    yztcfw (93)\n    eshrket (53) -> lluca, zntrxf, yaeji\n    flcth (56)\n    spuzkk (84)\n    kgntkz (149) -> gwlzolt, ithtabv\n    xvtvomy (81)\n    ratsida (38)\n    ybtsie (23)\n    qpfup (53)\n    ovzoej (129) -> emszr, olaxe\n    tdqqjpg (83) -> evauuqp, iunpq, douxy, zfkfc\n    akunww (38)\n    rjzvwv (21)\n    rwtyr (35)\n    bptimbu (46)\n    vyufo (65) -> eemxdkb, mdpwa\n    jgnvooj (51)\n    tbnuh (35)\n    siykhg (287) -> kizgz, ratsida\n    wjccpg (99)\n    qqbjpw (97)\n    zntrxf (96)\n    fgoqtbj (61)\n    bawyt (37)\n    voqlc (104) -> rmilbmd, hxzqgfl, zkyvs\n    rmbnnq (75)\n    fyqftv (30)\n    xztwenv (36)\n    votqgct (187)\n    diccfps (47)\n    fawih (12)\n    czzvje (15)\n    ujacw (91) -> ckddz, ccisqhk, yedpzj\n    lzkcsih (90)\n    fdplo (56)\n    xniyrk (194) -> npkqzzg, cqcqid\n    vtthqum (312) -> syxaall, avufwe\n    hbnjvi (28)\n    rmilbmd (76)\n    oxshhlc (72)\n    sykqu (230)\n    joruazf (35)\n    syxaall (59)\n    wzqcv (58)\n    xwuvr (207) -> vmcicx, vcumw\n    niuzt (5718) -> zdtby, imnmqmc, scurl, ovxnqnd\n    wxnwn (312) -> efwsj, hnszth\n    xgjyuie (211) -> wlauod, rkotan, lcltlz, yfkfk, vpuxpxj, remft, spagr\n    cdbqrv (75) -> xewgja, dvkjfk, oxpmdnr, sultgf, pmwzrxm\n    mfdpgv (48)\n    gumtctd (90)\n    adckzt (24)\n    dlksv (64)\n    npkqzzg (21)\n    yqjtia (148) -> xxikrr, jxcxf, bqgxg\n    zebtnox (13)\n    ecilwqw (75)\n    vjjhef (15)\n    pgfgtwj (73)\n    tqxwy (64)\n    xqeqnpv (79)\n    krcdkw (34)\n    cjzstd (113) -> pkmya, eeuykqk\n    nzygm (18)\n    crnvz (1261) -> etrye, zjpzq, uaajucq, hefczgn\n    udiibbj (78)\n    bncdhrm (3810) -> nnbcnzu, qsnwd, axsupxp\n    xfcaona (20) -> orozsek, vzhdg, ifylycs, howjlo\n    atbdhm (89)\n    drwyz (13)\n    ryclgvc (73)\n    fxhtvj (38)\n    fqhegd (65) -> lgowj, wlrdp, wzqcv\n    blzatj (154) -> zodnkd, jvlrpy\n    ongsjaf (96)\n    cqakc (131) -> lnddtya, ghhfd\n    yedpzj (36)\n    taslihw (198) -> nglzp, naheh\n    pxkqb (80) -> zstxoet, tzypui\n    zkbdn (16)\n    pkktbxs (81)\n    jklwqzz (90) -> hbsdlm, johqjt, ukjzi\n    mtwvvup (301) -> psfpl, ywctcn\n    xbgyvu (27)\n    clvvt (90)\n    ugmfrt (307) -> vwtpihe, sohtd, yluell, zrltc, bmfcc, dresa, httspr\n    cmyrw (138) -> vnqxpf, kihst\n    sohtd (156) -> zspyg, ylzdc\n    httspr (212) -> czrbivk, hjgfxun\n    bdkcdaq (64)\n    awhtfnb (74)\n    pxpuiaz (250)\n    ymfxsdp (61)\n    pmjoye (49)\n    zodnkd (7)\n    psdcdbm (51)\n    gijrym (18)\n    boqtus (16)\n    pfamjeh (13)\n    jtqcbjx (78)\n    cleda (62)\n    vltxhu (72)\n    qubakh (35)\n    ykiurcc (69)\n    tzupdgb (20)\n    hlcpmj (90)\n    tromme (35)\n    gqzlx (81)\n    icurk (153) -> ovlnitv, ivinyhh\n    oxpmdnr (244) -> hpboonp, vjycok\n    pzpybas (18)"


getExampleInput : String
getExampleInput =
    "pbga (66)\n    xhth (57)\n    ebii (61)\n    havc (66)\n    ktlj (57)\n    fwft (72) -> ktlj, cntj, xhth\n    qoyq (66)\n    padx (45) -> pbga, havc, qoyq\n    tknk (41) -> ugml, padx, fwft\n    jptl (61)\n    ugml (68) -> gyxo, ebii, jptl\n    gyxo (61)\n    cntj (57)"


type alias TowerBlock =
    { name : String
    , weight : Int
    , discContents : List String
    }


initialTowerBlock : TowerBlock
initialTowerBlock =
    TowerBlock "" 0 []


initialTowerBlockWithMaxWeight : TowerBlock
initialTowerBlockWithMaxWeight =
    TowerBlock "" 1000000000 []


getNameAndWeightFromCompartment : String -> ( String, Int )
getNameAndWeightFromCompartment compartment =
    let
        items =
            String.split " " compartment
    in
    case items of
        [ a, b ] ->
            let
                weight =
                    Result.withDefault 0 <|
                        String.toInt <|
                            String.filter isDigit b
            in
            ( a, weight )

        _ ->
            ( "", 0 )


transformRowToBlock : String -> TowerBlock
transformRowToBlock row =
    let
        rowCompartments =
            Array.fromList <|
                String.split " -> " row

        ( name, weight ) =
            getNameAndWeightFromCompartment <|
                Maybe.withDefault "" <|
                    Array.get 0 rowCompartments

        discContents =
            if Array.length rowCompartments > 1 then
                String.split ", " <|
                    Maybe.withDefault "" <|
                        Array.get 1 rowCompartments
            else
                []
    in
    TowerBlock name weight discContents


hasDiscs : TowerBlock -> Bool
hasDiscs block =
    not <| List.isEmpty block.discContents


isOnDisc : Array TowerBlock -> TowerBlock -> Bool
isOnDisc blocks block =
    Array.foldl
        (\b r ->
            if r then
                List.foldl
                    (\discItem rr ->
                        if discItem == block.name || not rr then
                            False
                        else
                            True
                    )
                    True
                    b.discContents
            else
                r
        )
        True
        blocks


getPuzzleRows : Array String
getPuzzleRows =
    Array.map String.trim <|
        Array.fromList <|
            -- String.lines getExampleInput
            String.lines getPuzzleInput



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     let
--         puzzleRows =
--             getPuzzleRows
--
--         puzzleBlocks =
--             Array.map
--                 transformRowToBlock
--                 puzzleRows
--
--         filteredBlocks =
--             Array.filter
--                 hasDiscs
--                 puzzleBlocks
--
--         bottomBlock =
--             Array.filter
--                 (isOnDisc filteredBlocks)
--                 filteredBlocks
--     in
--     toString bottomBlock


getPuzzleAnswer : String
getPuzzleAnswer =
    ""



-- toString <|
--     List.foldl
--         (\item r ->
--             if List.isEmpty item.discContents then
--                 r
--             else
--                 List.append [ item ] r
--         )
--         []
--         puzzleBlocks


getBlockFromName : Array TowerBlock -> String -> TowerBlock
getBlockFromName blocks name =
    Array.foldl
        (\block r ->
            if block.name == name then
                block
            else
                r
        )
        initialTowerBlock
        blocks


calculateDiscWeight : Array TowerBlock -> TowerBlock -> Int
calculateDiscWeight blocks block =
    if List.isEmpty block.discContents then
        block.weight
    else
        block.weight
            + List.foldl
                (\disc r ->
                    let
                        childBlock =
                            getBlockFromName blocks disc
                    in
                    r + childBlock.weight
                )
                0
                block.discContents


isDuplicate : List TowerBlock -> TowerBlock -> (TowerBlock -> b) -> Bool
isDuplicate tree branch func =
    List.any
        (\b ->
            func branch == func b
        )
        tree


getIndexFromValue list value index =
    let
        targetValue =
            Maybe.withDefault 0 <| List.head <| List.reverse <| List.take (index + 1) list
    in
    if targetValue == value then
        index
    else
        getIndexFromValue list value (index + 1)


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    let
        puzzleRows =
            getPuzzleRows

        puzzleBlocks =
            Array.map transformRowToBlock puzzleRows

        filteredBlocks =
            Array.filter hasDiscs puzzleBlocks

        bottomBlock =
            Maybe.withDefault initialTowerBlock <|
                Array.get 0 <|
                    Array.filter
                        (isOnDisc filteredBlocks)
                        filteredBlocks

        bottomDiscBlocks =
            List.map (getBlockFromName puzzleBlocks) bottomBlock.discContents

        getTreeFromBlock block previousElements =
            let
                discBlocks =
                    List.map (getBlockFromName puzzleBlocks) block.discContents
            in
            if List.isEmpty discBlocks then
                previousElements
            else
                List.foldl
                    (\discBlock r ->
                        List.append r <|
                            getTreeFromBlock discBlock (List.append previousElements [ discBlock ])
                    )
                    []
                    discBlocks

        calculateTreeWeight tree =
            List.foldl
                (\name r ->
                    (+) r <|
                        .weight <|
                            getBlockFromName puzzleBlocks name
                )
                0
                tree

        bottomBlockTrees =
            List.map
                (\disc ->
                    let
                        targetBlock =
                            getBlockFromName puzzleBlocks disc
                    in
                    getTreeFromBlock targetBlock [ targetBlock ]
                )
                bottomBlock.discContents

        filteredBlockTrees =
            List.map
                (\tree ->
                    List.foldl
                        (\branch r ->
                            if isDuplicate r branch .name then
                                r
                            else
                                List.append r [ branch ]
                        )
                        []
                        tree
                )
                bottomBlockTrees

        bottomBlockTreeNames =
            List.map (List.map .name) filteredBlockTrees

        bottomBlockTreeWeights =
            List.map calculateTreeWeight bottomBlockTreeNames

        unbalancedTreeValue =
            Maybe.withDefault 0 <|
                List.head <|
                    List.filter
                        (\item ->
                            let
                                occurrences =
                                    String.indexes (toString item) <| toString bottomBlockTreeWeights
                            in
                            if List.length occurrences > 1 then
                                False
                            else
                                True
                        )
                        bottomBlockTreeWeights

        unbalancedTreeIndex =
            getIndexFromValue bottomBlockTreeWeights unbalancedTreeValue 0

        unbalancedTreeWeightDifference =
            unbalancedTreeValue
                + (Maybe.withDefault 0 <| List.head <| List.reverse <| List.take (unbalancedTreeIndex + 1) bottomBlockTreeWeights)

        -- _ = Debug.log "bottomBlockTreeWeights" bottomBlockTreeWeights
        -- _ = Debug.log "unbalancedTreeValue" unbalancedTreeValue
        findBalancedDisc startingBlocks previousUnbalancedTree =
            let
                startingDiscBlocks =
                    List.map
                        (\b ->
                            List.map (getBlockFromName puzzleBlocks) b.discContents
                        )
                        startingBlocks

                startingDiscBlockWeights =
                    List.map
                        (\b ->
                            List.map getDiscWeight b
                        )
                        startingDiscBlocks

                -- _ =
                --     Debug.log "startingBlocks" startingBlocks
                --
                -- _ =
                --     Debug.log "startingDiscBlocks" <| List.concat startingDiscBlocks
                --
                -- _ =
                --     Debug.log "startingDiscBlockWeights" startingDiscBlockWeights
                --
                -- _ =
                --     Debug.log "startingDiscBlockWeights + ownWeight" <|
                --         List.map2
                --             (\s ss ->
                --                 List.map
                --                     (\sdbw ->
                --                         s.weight + sdbw
                --                     )
                --                     ss
                --             )
                --             startingBlocks
                --             startingDiscBlockWeights
            in
            if List.isEmpty startingDiscBlockWeights then
                Maybe.withDefault initialTowerBlock <| List.head <| startingBlocks
            else
                findBalancedDisc (List.concat startingDiscBlocks) previousUnbalancedTree

        -- _ =
        --     Debug.log "bottomBlock" bottomBlock
        --
        -- _ =
        --     Debug.log "gtzxxav" <| getBlockFromName puzzleBlocks "gtzxxav"
        --
        -- _ =
        --     Debug.log "findBalancedDisc" <| findBalancedDisc [ getBlockFromName puzzleBlocks "gjxqx" ] []
        getDiscWeight block =
            let
                discBlocks =
                    List.map (getBlockFromName puzzleBlocks) block.discContents
            in
            block.weight
                + (List.sum <| List.map .weight discBlocks)

        -- _ = Debug.log "sphbbz weight" <| getDiscWeight <| getBlockFromName puzzleBlocks "sphbbz"
        name =
            "rizjob"

        -- _ =
        --     Debug.log (name ++ " weight") <|
        --         (+) (.weight <| getBlockFromName puzzleBlocks name) <|
        --             List.sum <|
        --                 List.foldl
        --                     (\b r ->
        --                         List.map
        --                             (\bb ->
        --                                 getDiscWeight <|
        --                                     getBlockFromName puzzleBlocks bb
        --                             )
        --                             b.discContents
        --                     )
        --                     []
        --                     [ getBlockFromName puzzleBlocks name ]
    in
    "asdasdas"
