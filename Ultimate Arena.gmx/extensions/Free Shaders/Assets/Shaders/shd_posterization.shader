attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;


void main()
{  
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float brightness_amount;
uniform float contrast_amount;

uniform float gamma;
uniform float numColors;

void main()
{ 

//float gamma = 0.6; // 0.6
//float numColors = 32.0; // 8.0

  
  vec3 col = texture2D(gm_BaseTexture, v_texcoord).rgb;
  col = pow(abs(col), vec3(gamma, gamma, gamma));
  col = col * numColors;
  col = floor(col);
  col = col / numColors;
  col = pow(abs(col), vec3(1.0/gamma));
  gl_FragColor = vec4(col, texture2D(gm_BaseTexture, v_texcoord).a);
  
}
