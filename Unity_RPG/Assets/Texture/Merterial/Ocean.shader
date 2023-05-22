// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:33004,y:32754,varname:node_2865,prsc:2|diff-70-OUT,spec-348-OUT,gloss-1813-OUT,normal-4289-OUT;n:type:ShaderForge.SFN_Slider,id:1813,x:32250,y:32882,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Metallic_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.95,max:1;n:type:ShaderForge.SFN_Vector1,id:348,x:32379,y:32765,varname:node_348,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:593,x:31988,y:32480,ptovrint:False,ptlb:Deep,ptin:_Deep,varname:node_593,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.3,c3:0.2,c4:1;n:type:ShaderForge.SFN_Color,id:1099,x:31988,y:32645,ptovrint:False,ptlb:Shallow,ptin:_Shallow,varname:node_1099,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4,c2:0.8,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:70,x:32250,y:32561,varname:node_70,prsc:2|A-593-RGB,B-1099-RGB,T-9799-OUT;n:type:ShaderForge.SFN_Fresnel,id:9799,x:31988,y:32794,varname:node_9799,prsc:2|NRM-8203-OUT,EXP-796-OUT;n:type:ShaderForge.SFN_NormalVector,id:8203,x:31773,y:32702,prsc:2,pt:True;n:type:ShaderForge.SFN_ValueProperty,id:5690,x:31571,y:32835,ptovrint:False,ptlb:Colour Fresnel,ptin:_ColourFresnel,varname:node_5690,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.33;n:type:ShaderForge.SFN_ConstantClamp,id:796,x:31773,y:32848,varname:node_796,prsc:2,min:0,max:4|IN-5690-OUT;n:type:ShaderForge.SFN_Tex2d,id:3892,x:32147,y:33070,varname:node_3892,prsc:2,ntxv:0,isnm:False|UVIN-4344-OUT,TEX-3375-TEX;n:type:ShaderForge.SFN_Tex2d,id:9004,x:32143,y:33426,varname:node_9004,prsc:2,ntxv:0,isnm:False|UVIN-1035-OUT,TEX-3375-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:3375,x:31849,y:33151,ptovrint:False,ptlb:Normal_map,ptin:_Normal_map,varname:node_3375,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:4289,x:33005,y:33326,varname:node_4289,prsc:2|A-7922-OUT,B-4863-OUT,T-2937-OUT;n:type:ShaderForge.SFN_Slider,id:2937,x:32673,y:33578,ptovrint:False,ptlb:Normal_blend,ptin:_Normal_blend,varname:node_2937,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Time,id:8228,x:31041,y:34030,varname:node_8228,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:9629,x:30911,y:32946,varname:node_9629,prsc:2;n:type:ShaderForge.SFN_Append,id:470,x:31166,y:33041,varname:node_470,prsc:2|A-9629-X,B-9629-Z;n:type:ShaderForge.SFN_Divide,id:1594,x:31368,y:33121,varname:node_1594,prsc:2|A-470-OUT,B-2448-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2448,x:31166,y:33192,ptovrint:False,ptlb:node_2448,ptin:_node_2448,varname:node_2448,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Set,id:921,x:31547,y:33121,varname:_worldUV,prsc:2|IN-1594-OUT;n:type:ShaderForge.SFN_Get,id:1289,x:30767,y:33683,varname:node_1289,prsc:2|IN-921-OUT;n:type:ShaderForge.SFN_Set,id:5973,x:31866,y:33597,varname:UV1,prsc:2|IN-4688-OUT;n:type:ShaderForge.SFN_Set,id:7433,x:31878,y:33705,varname:UV2,prsc:2|IN-3018-OUT;n:type:ShaderForge.SFN_Vector4Property,id:3731,x:31032,y:33385,ptovrint:False,ptlb:UV1 Ani,ptin:_UV1Ani,varname:node_3731,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Vector4Property,id:8635,x:31041,y:33873,ptovrint:False,ptlb:UV2 Ani,ptin:_UV2Ani,varname:node_8635,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_ComponentMask,id:8730,x:31280,y:33601,varname:node_8730,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1532-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2631,x:31280,y:33747,varname:node_2631,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1915-OUT;n:type:ShaderForge.SFN_Multiply,id:7822,x:31280,y:33354,varname:node_7822,prsc:2|A-3731-X,B-8228-TSL;n:type:ShaderForge.SFN_Multiply,id:9356,x:31280,y:33476,varname:node_9356,prsc:2|A-3731-Y,B-8228-TSL;n:type:ShaderForge.SFN_Add,id:1643,x:31505,y:33459,varname:node_1643,prsc:2|A-7822-OUT,B-8730-R;n:type:ShaderForge.SFN_Add,id:389,x:31505,y:33611,varname:node_389,prsc:2|A-9356-OUT,B-8730-G;n:type:ShaderForge.SFN_Append,id:4688,x:31672,y:33545,varname:node_4688,prsc:2|A-1643-OUT,B-389-OUT;n:type:ShaderForge.SFN_Add,id:8621,x:31505,y:33726,varname:node_8621,prsc:2|A-2631-R,B-2170-OUT;n:type:ShaderForge.SFN_Add,id:3154,x:31505,y:33859,varname:node_3154,prsc:2|A-2631-G,B-3039-OUT;n:type:ShaderForge.SFN_Multiply,id:2170,x:31280,y:33904,varname:node_2170,prsc:2|A-8635-X,B-8228-TSL;n:type:ShaderForge.SFN_Multiply,id:3039,x:31280,y:34040,varname:node_3039,prsc:2|A-8635-Y,B-8228-TSL;n:type:ShaderForge.SFN_Append,id:3018,x:31672,y:33741,varname:node_3018,prsc:2|A-8621-OUT,B-3154-OUT;n:type:ShaderForge.SFN_Multiply,id:1532,x:31032,y:33573,varname:node_1532,prsc:2|A-1289-OUT,B-6866-OUT;n:type:ShaderForge.SFN_Multiply,id:1915,x:31032,y:33706,varname:node_1915,prsc:2|A-1289-OUT,B-2834-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6866,x:30767,y:33762,ptovrint:False,ptlb:UV1_Tiling,ptin:_UV1_Tiling,varname:node_6866,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:2834,x:30767,y:33846,ptovrint:False,ptlb:UV2_Tiling,ptin:_UV2_Tiling,varname:node_2834,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Get,id:4344,x:31828,y:33083,varname:node_4344,prsc:2|IN-5973-OUT;n:type:ShaderForge.SFN_Get,id:1035,x:31828,y:33336,varname:node_1035,prsc:2|IN-7433-OUT;n:type:ShaderForge.SFN_Slider,id:5537,x:32093,y:33281,ptovrint:False,ptlb:Normal 1 strangth,ptin:_Normal1strangth,varname:node_5537,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:9395,x:32544,y:33070,varname:node_9395,prsc:2|A-9422-OUT,B-5537-OUT;n:type:ShaderForge.SFN_Vector1,id:8214,x:32540,y:33250,varname:node_8214,prsc:2,v1:1;n:type:ShaderForge.SFN_Append,id:7922,x:32742,y:33200,varname:node_7922,prsc:2|A-9395-OUT,B-8214-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9422,x:32328,y:33070,varname:node_9422,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-3892-RGB;n:type:ShaderForge.SFN_ComponentMask,id:7576,x:32337,y:33426,varname:node_7576,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-9004-RGB;n:type:ShaderForge.SFN_Multiply,id:2200,x:32540,y:33426,varname:node_2200,prsc:2|A-7576-OUT,B-1067-OUT;n:type:ShaderForge.SFN_Append,id:4863,x:32742,y:33371,varname:node_4863,prsc:2|A-2200-OUT,B-8214-OUT;n:type:ShaderForge.SFN_Slider,id:1067,x:32095,y:33629,ptovrint:False,ptlb:Normal 2 strangth,ptin:_Normal2strangth,varname:node_1067,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:593-1099-5690-1813-2448-3375-3731-8635-2937-6866-2834-5537-1067;pass:END;sub:END;*/

Shader "Shader Forge/Ocean" {
    Properties {
        _Deep ("Deep", Color) = (0,0.3,0.2,1)
        _Shallow ("Shallow", Color) = (0.4,0.8,1,1)
        _ColourFresnel ("Colour Fresnel", Float ) = 1.33
        _Gloss ("Gloss", Range(0, 1)) = 0.95
        _node_2448 ("node_2448", Float ) = 1
        _Normal_map ("Normal_map", 2D) = "white" {}
        _UV1Ani ("UV1 Ani", Vector) = (0,0,0,0)
        _UV2Ani ("UV2 Ani", Vector) = (0,0,0,0)
        _Normal_blend ("Normal_blend", Range(0, 1)) = 0
        _UV1_Tiling ("UV1_Tiling", Float ) = 0
        _UV2_Tiling ("UV2_Tiling", Float ) = 0
        _Normal1strangth ("Normal 1 strangth", Range(0, 1)) = 0
        _Normal2strangth ("Normal 2 strangth", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Gloss;
            uniform float4 _Deep;
            uniform float4 _Shallow;
            uniform float _ColourFresnel;
            uniform sampler2D _Normal_map; uniform float4 _Normal_map_ST;
            uniform float _Normal_blend;
            uniform float _node_2448;
            uniform float4 _UV1Ani;
            uniform float4 _UV2Ani;
            uniform float _UV1_Tiling;
            uniform float _UV2_Tiling;
            uniform float _Normal1strangth;
            uniform float _Normal2strangth;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD9;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_8228 = _Time;
                float2 _worldUV = (float2(i.posWorld.r,i.posWorld.b)/_node_2448);
                float2 node_1289 = _worldUV;
                float2 node_8730 = (node_1289*_UV1_Tiling).rg;
                float2 UV1 = float2(((_UV1Ani.r*node_8228.r)+node_8730.r),((_UV1Ani.g*node_8228.r)+node_8730.g));
                float2 node_4344 = UV1;
                float4 node_3892 = tex2D(_Normal_map,TRANSFORM_TEX(node_4344, _Normal_map));
                float node_8214 = 1.0;
                float2 node_2631 = (node_1289*_UV2_Tiling).rg;
                float2 UV2 = float2((node_2631.r+(_UV2Ani.r*node_8228.r)),(node_2631.g+(_UV2Ani.g*node_8228.r)));
                float2 node_1035 = UV2;
                float4 node_9004 = tex2D(_Normal_map,TRANSFORM_TEX(node_1035, _Normal_map));
                float3 normalLocal = lerp(float3((node_3892.rgb.rg*_Normal1strangth),node_8214),float3((node_9004.rgb.rg*_Normal2strangth),node_8214),_Normal_blend);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float perceptualRoughness = 1.0 - _Gloss;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = 0.0;
                float specularMonochrome;
                float3 diffuseColor = lerp(_Deep.rgb,_Shallow.rgb,pow(1.0-max(0,dot(normalDirection, viewDirection)),clamp(_ColourFresnel,0,4))); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                half surfaceReduction;
                #ifdef UNITY_COLORSPACE_GAMMA
                    surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;
                #else
                    surfaceReduction = 1.0/(roughness*roughness + 1.0);
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                indirectSpecular *= surfaceReduction;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Gloss;
            uniform float4 _Deep;
            uniform float4 _Shallow;
            uniform float _ColourFresnel;
            uniform sampler2D _Normal_map; uniform float4 _Normal_map_ST;
            uniform float _Normal_blend;
            uniform float _node_2448;
            uniform float4 _UV1Ani;
            uniform float4 _UV2Ani;
            uniform float _UV1_Tiling;
            uniform float _UV2_Tiling;
            uniform float _Normal1strangth;
            uniform float _Normal2strangth;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_8228 = _Time;
                float2 _worldUV = (float2(i.posWorld.r,i.posWorld.b)/_node_2448);
                float2 node_1289 = _worldUV;
                float2 node_8730 = (node_1289*_UV1_Tiling).rg;
                float2 UV1 = float2(((_UV1Ani.r*node_8228.r)+node_8730.r),((_UV1Ani.g*node_8228.r)+node_8730.g));
                float2 node_4344 = UV1;
                float4 node_3892 = tex2D(_Normal_map,TRANSFORM_TEX(node_4344, _Normal_map));
                float node_8214 = 1.0;
                float2 node_2631 = (node_1289*_UV2_Tiling).rg;
                float2 UV2 = float2((node_2631.r+(_UV2Ani.r*node_8228.r)),(node_2631.g+(_UV2Ani.g*node_8228.r)));
                float2 node_1035 = UV2;
                float4 node_9004 = tex2D(_Normal_map,TRANSFORM_TEX(node_1035, _Normal_map));
                float3 normalLocal = lerp(float3((node_3892.rgb.rg*_Normal1strangth),node_8214),float3((node_9004.rgb.rg*_Normal2strangth),node_8214),_Normal_blend);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float perceptualRoughness = 1.0 - _Gloss;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = 0.0;
                float specularMonochrome;
                float3 diffuseColor = lerp(_Deep.rgb,_Shallow.rgb,pow(1.0-max(0,dot(normalDirection, viewDirection)),clamp(_ColourFresnel,0,4))); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Gloss;
            uniform float4 _Deep;
            uniform float4 _Shallow;
            uniform float _ColourFresnel;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float3 diffColor = lerp(_Deep.rgb,_Shallow.rgb,pow(1.0-max(0,dot(normalDirection, viewDirection)),clamp(_ColourFresnel,0,4)));
                float specularMonochrome;
                float3 specColor;
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, 0.0, specColor, specularMonochrome );
                float roughness = 1.0 - _Gloss;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
