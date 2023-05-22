Shader "HOD_WindowRainDrop"
{
	Properties
	{
		_Color1("Color 1", Color) = (1,1,1,0)
		_Texture("Texture", 2D) = "bump" {}
		_Float0("Float 0", Range( 0 , 1)) = 0.1064283
		_NormalTexture("Normal Texture", 2D) = "white" {}
		_RainTiling("Rain Tiling ", Float) = 1
		_NormalStrength("Normal Strength", Range( 0 , 1)) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
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
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
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
		uniform float _Float0;
		uniform sampler2D _Texture;
		uniform float4 _Texture_ST;
		uniform float4 _Color1;
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
			float2 uv_Texture = i.uv_texcoord * _Texture_ST.xy + _Texture_ST.zw;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float4 screenColor49 = tex2D( _GrabTexture, ( float4( UnpackScaleNormal( tex2D( _Texture, uv_Texture ), _Float0 ) , 0.0 ) + ase_grabScreenPosNorm ).xy );
			o.Albedo = ( (screenColor49).rgba * _Color1 ).rgb;
			o.Metallic = _Metallic;
			o.Smoothness = ( ( tex2D( _RenderTexture, uv_TexCoord29 ) * _Power ) + _Smoothness ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
}