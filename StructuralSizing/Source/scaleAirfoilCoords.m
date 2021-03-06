%{
Copyright (c) 2012, Danny Sale 
Copyright (c) 2016, H.J. Sommer 
Copyright (c) 2009, John D'Errico 
Copyright (c) 2017, Yair Altman 
Copyright (c) 2016, S. Samuel Chen 
All rights reserved.

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are 
met:

* Redistributions of source code must retain the above copyright 
notice, this list of conditions and the following disclaimer. 
* Redistributions in binary form must reproduce the above copyright 
notice, this list of conditions and the following disclaimer in 
the documentation and/or other materials provided with the distribution 
* Neither the name of the Penn State University nor the names 
of its contributors may be used to endorse or promote products derived 
from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE.
%}
  
function [X Y] = scaleAirfoilCoords(x, y, pitAxis, chord, aeroTwst)

%% Translate the x/c-coordinates so the pitch axis is at the origin
x = x - pitAxis;

%% Scale x/c - y/c coordinates by the chord length
x = x .* chord;
y = y .* chord;

%% rotate x - y airfoil coordinates by the aero twist angle
aeroTwst = aeroTwst * pi/180; % convert degrees to radians
r        = sqrt(x.^2 + y.^2);
theta    = atan2(y, x);       
X        = r .* cos(theta + aeroTwst);
Y        = r .* sin(theta + aeroTwst);

end % function scaleAirfoilCoords
