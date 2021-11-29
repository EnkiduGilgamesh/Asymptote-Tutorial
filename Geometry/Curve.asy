/*
 * File: \Curve.asy
 * Project: Geometry
 * Created Date: Tuesday Nov 23rd 2021, 7:53:37 pm
 * Author: Wenren Muyan
 * Comments: 
 * --------------------------------------------------------------------------------
 * Last Modified: 23/11/2021 08:19:25
 * Modified By: Wenren Muyan
 * --------------------------------------------------------------------------------
 * Copyright (c) 2021 - future Wenren Muyan
 * --------------------------------------------------------------------------------
 * HISTORY:
 * Date				By				Comments
 * --------------------------------------------------------------------------------
 */


size(100, 0);

path unitcircle = E..N..W..S..cycle;
path g = scale(2)*unitcircle;
filldraw(unitcircle^^g, evenodd+yellow, black);

draw((2,3){up}..(0,5){left}, Arrow);
