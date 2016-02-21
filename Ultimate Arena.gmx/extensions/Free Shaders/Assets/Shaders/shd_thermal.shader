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
    vec4 base_colour = texture2D(gm_BaseTexture, v_texcoord);
    
    
    float lum = (base_colour.r+base_colour.g+base_colour.b)/3.0;
    
    vec3 colour_1 = vec3(0.0,0.0,1.0);
    vec3 colour_2 = vec3(1.0,1.0,0.0);
    vec3 colour_3 = vec3(1.0,0.0,0.0);
    
    vec3 ix = vec3(0.0);
    vec3 ix_2 = vec3(0.0);
    if (lum < 0.5)
    {
        ix = colour_1;
        ix_2 = colour_2;
    }
    else
    {
        ix = colour_2;
        ix_2 = colour_3;
    }
    
    
    vec3 thermal = mix(ix, ix_2,(lum-float(ix)*0.5)/0.5);
    
 gl_FragColor = vec4(thermal,base_colour.a);
 
}
