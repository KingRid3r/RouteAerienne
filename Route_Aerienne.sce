function o=orthodormique(ltA,lgA,ltB,lgB)
    o=acosd(sind(ltA)*sind(ltB)+cosd(ltA)*cosd(ltB)*cosd(lgB-lgA))*60*1.852
endfunction

function r = route_ortho(ltA, lgA, ltB, lgB)
    // r=(cosd(ltB)*sind(lgB-lgA))/sind();  // formule papier
    r=acotd(((cosd(ltA)*sind(ltB))-(sind(ltA)*cosd(ltB)*cosd(lgB-lgA)))/(cosd(ltB)*sind(lgB-lgA)));
endfunction

function p=saisie()
    txt = ['Latitude   ';'Minutes    ';'Secondes   ';'Longitudes ';'Minutes    '; 'Secondes   '];
    sig = x_mdialog('Coordonnées',txt,['0';'0';'0';'0';'0';'0'])
    Lt = evstr(sig(1))
    mLt = evstr(sig(2))
    sLt = evstr(sig(3))
    Lg = evstr(sig(4))
    mLg = evstr(sig(4))
    sLg = evstr(sig(5))
    l = Lt+(mLt/60)+(sLt/3600)
    L = Lg+(mLg/60)+(sLg/3600)
    
    p=[l,L]
endfunction

function calcule_route_aerienne()
    txt = ['la disctance orthodormique est de ' ; 'Le cap du tronçon initial à suivre est de']
    x_dialog('Vous allez saisire les coordonnées du premier point')
    p1=saisie()
    x_dialog('Vous allez saisire les coordonnées du second point')
    p2=saisie()
    o=orthodormique(p1(1),p1(2),p2(1),p2(2))
    k=string(o)
    r=string(route_ortho(p1(1),p1(2),p2(1),p2(2)))
    x_mdialog ('résultat',txt,[k+" km";r])
endfunction


