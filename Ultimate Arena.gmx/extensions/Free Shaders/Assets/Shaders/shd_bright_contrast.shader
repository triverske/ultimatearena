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

void main()
{ 
    vec4 colour = texture2D(gm_BaseTexture,v_texcoord);
    gl_FragColor = vec4( (colour.rgb+brightness_amount) * (1.0+contrast_amount)/1.0, colour.a);
}
