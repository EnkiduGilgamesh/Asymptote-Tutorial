/*
 * File: \sin.asy
 * Project: 6_Graph
 * Created Date: Monday Dec 13th 2021, 1:17:04 pm
 * Author: Wenren Muyan
 * Comments: 
 * --------------------------------------------------------------------------------
 * Last Modified: 13/12/2021 01:17:23
 * Modified By: Wenren Muyan
 * --------------------------------------------------------------------------------
 * Copyright (c) 2021 - future Wenren Muyan
 * --------------------------------------------------------------------------------
 * HISTORY:
 * Date				By				Comments
 * --------------------------------------------------------------------------------
 */


settings.outformat="pdf"; 
size(4cm,3cm, keepAspect=false); 
import graph; 
pair f(real t) { 
    return (1/t, sin(t));
}
draw(graph(f, 1, 10^4, n=5*10^5), thin());
draw((0,-1.1)--(0,1.3), arrow=Arrow(TeXHead));
draw((0,0)--(1.05,0), arrow=Arrow(TeXHead));
