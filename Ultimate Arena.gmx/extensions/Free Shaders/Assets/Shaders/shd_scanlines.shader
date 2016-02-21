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

uniform vec2 resolution;
  
void main()
{

    vec4 colour = texture2D(gm_BaseTexture, v_texcoord);
    
    float half_y = v_texcoord.y * resolution.y * 0.5;
    float delta = floor(half_y) - half_y;
    if (delta * delta < 0.1) { colour.rgb = vec3(0.0); }
   
    gl_FragColor = colour;
}
