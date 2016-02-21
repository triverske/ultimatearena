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

void main()
{ 
    vec2 onePixel = vec2(1.0 / resolution.x, 1.0 / resolution.y);
    vec2 uv = v_texcoord;
    
    vec3 colour = vec3(0.5);
    colour -= texture2D(gm_BaseTexture, uv - onePixel).rgb;
    colour += texture2D(gm_BaseTexture, uv + onePixel).rgb;
    colour.rgb = vec3((colour.r + colour.g + colour.b) / 3.0);
    
    gl_FragColor = vec4(colour.rgb, texture2D(gm_BaseTexture,uv).a);
}
