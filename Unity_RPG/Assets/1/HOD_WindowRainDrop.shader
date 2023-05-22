// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "HOD_WindowRainDrop"
{
	Properties
	{
		_NormalTexture("Normal Texture", 2D) = "white" {}
		_RainTiling("Rain Tiling ", Float) = 1
		_NormalStrength("Normal Strength", Range( 0 , 1)) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Texture0("Texture 0", 2D) = "white" {}
		_RenderTexture("Render Texture", 2D) = "white" {}
		_Power("Power", Float) = 3
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.589324
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Off
		GrabPass{ }
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
			float4 screenPos;
		};

		uniform float _NormalStrength;
		uniform sampler2D _NormalTexture;
		uniform float4 _NormalTexture_ST;
		uniform sampler2D _RenderTexture;
		uniform float _RainTiling;
		uniform sampler2D _GrabTexture;
		uniform sampler2D _Texture0;
		uniform float4 _Texture0_ST;
		uniform float _Metallic;
		uniform float _Power;
		uniform float _Smoothness;


		inline float4 ASE_ComputeGrabScreenPos( float4 pos )
		{
			#if UNITY_UV_STARTS_AT_TOP
			float scale = -1.0;
			#else
			float scale = 1.0;
			#endif
			float4 o = pos;
			o.y = pos.w * 0.5f;
			o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
			return o;
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_NormalTexture = i.uv_texcoord * _NormalTexture_ST.xy + _NormalTexture_ST.zw;
			float2 temp_cast_0 = (_RainTiling).xx;
			float2 uv_TexCoord29 = i.uv_texcoord * temp_cast_0;
			float2 temp_output_2_0_g1 = uv_TexCoord29;
			float2 break6_g1 = temp_output_2_0_g1;
			float temp_output_25_0_g1 = ( pow( 0.5 , 3.0 ) * 0.1 );
			float2 appendResult8_g1 = (float2(( break6_g1.x + temp_output_25_0_g1 ) , break6_g1.y));
			float4 tex2DNode14_g1 = tex2D( _RenderTexture, temp_output_2_0_g1 );
			float temp_output_4_0_g1 = 2.0;
			float3 appendResult13_g1 = (float3(1.0 , 0.0 , ( ( tex2D( _RenderTexture, appendResult8_g1 ).g - tex2DNode14_g1.g ) * temp_output_4_0_g1 )));
			float2 appendResult9_g1 = (float2(break6_g1.x , ( break6_g1.y + temp_output_25_0_g1 )));
			float3 appendResult16_g1 = (float3(0.0 , 1.0 , ( ( tex2D( _RenderTexture, appendResult9_g1 ).g - tex2DNode14_g1.g ) * temp_output_4_0_g1 )));
			float3 normalizeResult22_g1 = normalize( cross( appendResult13_g1 , appendResult16_g1 ) );
			o.Normal = BlendNormals( UnpackScaleNormal( tex2D( _NormalTexture, uv_NormalTexture ), _NormalStrength ) , normalizeResult22_g1 );
			float2 uv_Texture0 = i.uv_texcoord * _Texture0_ST.xy + _Texture0_ST.zw;
			float2 temp_output_2_0_g2 = uv_Texture0;
			float2 break6_g2 = temp_output_2_0_g2;
			float temp_output_25_0_g2 = ( pow( 1.0 , 3.0 ) * 0.1 );
			float2 appendResult8_g2 = (float2(( break6_g2.x + temp_output_25_0_g2 ) , break6_g2.y));
			float4 tex2DNode14_g2 = tex2D( _Texture0, temp_output_2_0_g2 );
			float temp_output_4_0_g2 = 2.0;
			float3 appendResult13_g2 = (float3(1.0 , 0.0 , ( ( tex2D( _Texture0, appendResult8_g2 ).g - tex2DNode14_g2.g ) * temp_output_4_0_g2 )));
			float2 appendResult9_g2 = (float2(break6_g2.x , ( break6_g2.y + temp_output_25_0_g2 )));
			float3 appendResult16_g2 = (float3(0.0 , 1.0 , ( ( tex2D( _Texture0, appendResult9_g2 ).g - tex2DNode14_g2.g ) * temp_output_4_0_g2 )));
			float3 normalizeResult22_g2 = normalize( cross( appendResult13_g2 , appendResult16_g2 ) );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float4 screenColor49 = tex2Dproj( _GrabTexture, UNITY_PROJ_COORD( ( float4( BlendNormals( normalizeResult22_g2 , float3( 0,0,0 ) ) , 0.0 ) + ase_grabScreenPosNorm ) ) );
			float4 screenColor59 = tex2Dproj( _GrabTexture, UNITY_PROJ_COORD( ase_grabScreenPos ) );
			float4 lerpResult45 = lerp( ( (screenColor49).rgba * screenColor59 ) , float4( 0,0,0,0 ) , float4( 0,0,0,0 ));
			o.Albedo = lerpResult45.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = ( ( tex2D( _RenderTexture, uv_TexCoord29 ) * _Power ) + _Smoothness ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15606
864;143;1052;917;2347.579;1186.326;2.557619;True;False
Node;AmplifyShaderEditor.TexturePropertyNode;58;-1855.519,-655.507;Float;True;Property;_Texture0;Texture 0;12;0;Create;True;0;0;False;0;dfa42d97737470e4896a1361e4de85e4;None;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.FunctionNode;57;-1543.848,-609.6354;Float;False;NormalCreate;6;;2;e12f7ae19d416b942820e3932b56220f;0;4;1;SAMPLER2D;;False;2;FLOAT2;0,0;False;3;FLOAT;1;False;4;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GrabScreenPosition;52;-1451.949,-122.2248;Float;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendNormalsNode;56;-1539.862,-376.343;Float;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-1577.807,373.5049;Float;False;Property;_RainTiling;Rain Tiling ;9;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;50;-1238.679,-346.9885;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TexturePropertyNode;28;-1392,128;Float;True;Property;_RenderTexture;Render Texture;13;0;Create;True;0;0;False;0;dfa42d97737470e4896a1361e4de85e4;None;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;29;-1358.443,356.3636;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenColorNode;49;-1078.222,-512.7679;Float;False;Global;_GrabScreen0;Grab Screen 0;0;0;Create;True;0;0;True;0;Object;-1;False;True;1;0;FLOAT4;0,0,0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenColorNode;59;-847.8081,-285.1121;Float;False;Global;_GrabScreen1;Grab Screen 1;12;0;Create;True;0;0;False;0;Object;-1;False;True;1;0;FLOAT4;0,0,0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;22;-1028.936,-43.91821;Float;False;Property;_NormalStrength;Normal Strength;10;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;32;-964.995,355.3932;Float;True;Property;_TextureSample3;Texture Sample 3;9;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;47;-834.3466,-547.3479;Float;False;True;True;True;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-943.5836,587.1906;Float;False;Property;_Power;Power;14;0;Create;True;0;0;False;0;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-414.0363,394.2101;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;24;-976,144;Float;False;NormalCreate;6;;1;e12f7ae19d416b942820e3932b56220f;0;4;1;SAMPLER2D;;False;2;FLOAT2;0,0;False;3;FLOAT;0.5;False;4;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-561.2717,-540.9355;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-534.3315,573.5803;Float;False;Property;_Smoothness;Smoothness;15;0;Create;True;0;0;False;0;0.589324;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;21;-697.5352,-91.7182;Float;True;Property;_NormalTexture;Normal Texture;8;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendNormalsNode;18;-384,32;Float;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;34;-209.6291,408.9051;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;45;-290.7504,-284.269;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-626.3938,164.3785;Float;False;Property;_Metallic;Metallic;11;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;60;-619.0294,-314.5368;Float;False;Color Mask;-1;;3;eec747d987850564c95bde0e5a6d1867;0;4;1;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;55;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;HOD_WindowRainDrop;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;57;1;58;0
WireConnection;56;0;57;0
WireConnection;50;0;56;0
WireConnection;50;1;52;0
WireConnection;29;0;31;0
WireConnection;49;0;50;0
WireConnection;32;0;28;0
WireConnection;32;1;29;0
WireConnection;47;0;49;0
WireConnection;33;0;32;0
WireConnection;33;1;35;0
WireConnection;24;1;28;0
WireConnection;24;2;29;0
WireConnection;46;0;47;0
WireConnection;46;1;59;0
WireConnection;21;5;22;0
WireConnection;18;0;21;0
WireConnection;18;1;24;0
WireConnection;34;0;33;0
WireConnection;34;1;25;0
WireConnection;45;0;46;0
WireConnection;55;0;45;0
WireConnection;55;1;18;0
WireConnection;55;3;26;0
WireConnection;55;4;34;0
ASEEND*/
//CHKSM=FD2A466DA2DC97D4B5D5C64BA53D281002C0F978