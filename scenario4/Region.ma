[top]
components : Region 

[Region]
type : cell
dim : (30,30,3)
delay : inertial
defaultDelayTime  : 0
border : nowrapped
neighbors : superficie(-1,-1,0) superficie(-1,0,0) superficie(-1,1,0)
neighbors : superficie(0,-1,0)  superficie(0,0,0)  superficie(0,1,0)
neighbors : superficie(1,-1,0)  superficie(1,0,0)  superficie(1,1,0)
neighbors : superficie(-1,-1,1) superficie(-1,0,1) superficie(-1,1,1)
neighbors : superficie(0,-1,1)  superficie(0,0,1)  superficie(0,1,1)
neighbors : superficie(1,-1,1)  superficie(1,0,1)  superficie(1,1,1)
neighbors : superficie(-1,-1,2) superficie(-1,0,2) superficie(-1,1,2)
neighbors : superficie(0,-1,2)  superficie(0,0,2)  superficie(0,1,2)
neighbors : superficie(1,-1,2)  superficie(1,0,2)  superficie(1,1,2)
initialvalue : 0
initialCellsValue : Region.val
zone : spread { (0,0,1)..(0,29,1), (3,0,1)..(3,29,1), (6,0,1)..(6,29,1), 
(9,0,1)..(9,29,1), (12,0,1)..(12,29,1), (15,0,1)..(15,29,1), (18,0,1)..(18,29,1), 
(21,0,1)..(21,29,1), (24,0,1)..(24,29,1), (27,0,1)..(27,29,1) }
zone : edge { (1,0,1)..(1,29,1), (4,0,1)..(4,29,1), (7,0,1)..(7,29,1),
(10,0,1)..(10,29,1), (13,0,1)..(13,29,1), (16,0,1)..(16,29,1), (19,0,1)..(19,29,1), 
(22,0,1)..(22,29,1),(25,0,1)..(25,29,1), (28,0,1)..(28,29,1) }
zone : road { (2,0,1)..(2,29,1), (5,0,1)..(5,29,1), (8,0,1)..(8,29,1),
(11,0,1)..(11,29,1), (14,0,1)..(14,29,1), (17,0,1)..(17,29,1), (20,0,1)..(20,29,1), 
(23,0,1)..(23,29,1),(26,0,1)..(26,29,1), (29,0,1)..(29,29,1) }
zone : corridor { (0,0,2)..(0,29,2), (3,0,2)..(3,29,2), (6,0,2)..(6,29,2), 
(9,0,2)..(9,29,2), (12,0,2)..(12,29,2), (15,0,2)..(15,29,2), (18,0,2)..(18,29,2), 
(21,0,2)..(21,29,2), (24,0,2)..(24,29,2), (27,0,2)..(27,29,2) }
zone : city { (1,0,2)..(1,29,2), (4,0,2)..(4,29,2), (7,0,2)..(7,29,2),
(10,0,2)..(10,29,2), (13,0,2)..(13,29,2), (16,0,2)..(16,29,2), (19,0,2)..(19,29,2), 
(22,0,2)..(22,29,2),(25,0,2)..(25,29,2), (28,0,2)..(28,29,2) }
zone : disaster { (2,0,2)..(2,29,2), (5,0,2)..(5,29,2), (8,0,2)..(8,29,2),
(11,0,2)..(11,29,2), (14,0,2)..(14,29,2), (17,0,2)..(17,29,2), (20,0,2)..(20,29,2), 
(23,0,2)..(23,29,2),(26,0,2)..(26,29,2), (29,0,2)..(29,29,2) }

localtransition : RegionBehavior

[road]
rule : {(0,0,0)} 100 { t }

[corridor]
rule : {(0,0,0)} 100 { t }

[city]
rule : {(0,0,0)} 100 { t }

[disaster]
rule : {(0,0,0)} 100 { t }

[spread]
rule : {1} 100 { (-1,0,0)>0 and (0,0,0)=0 and (1,0,0)=0 }
rule : {1} 100 { (0,0,0)=0 and (1,0,0)=1 }
rule : {1} 100 { (0,-1,0)>0 and (0,0,0)=0 and (0,1,0)=0 }
rule : {1} 100 { (0,0,0)=0 and (0,1,0)=1 }
rule : {(0,0,0)} 100 { t }

[edge]
rule : {0} 100 { (-1,0,0)>0 and (0,0,0)>0 and (1,0,0)=0 }
rule : {1} 100 { (0,0,0)=0 and (1,0,0)=1 }
rule : {0} 100 { (0,-1,0)>0 and (0,0,0)>0 and (0,1,0)=0 }
rule : {1} 100 { (0,0,0)=0 and (0,1,0)=1 }
rule : {(0,0,0)} 100 { t }

[RegionBehavior]
% Calculate Gtotal
rule : { randInt(1) + (0,0,1) + (0,0,2) + 
(1,0,1) + (1,0,2) + (0,-1,1) + (0,-1,2) +
(-1,-1,1) + (-1,-1,2) + (1,1,1) + (1,1,2) + 
(-1,0,1) + (-1,0,2) + (0,1,1) + (0,1,2) + 
(-1,1,1) + (-1,1,2) }
{100} 
{ t }
