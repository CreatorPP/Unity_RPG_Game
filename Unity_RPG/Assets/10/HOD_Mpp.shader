Shader "HOD_Multipurpose"
{
	Properties
	{
		_MainTexture("Main Texture", 2D) = "white" {}		
		_MainColor("Main Color", Color) = (0,0,0,0)		
		_CutoutTexture("Cutout Texture", 2D) = "white" {}
		_Color("Color", Range( 0 , 2)) = 0
		[HDR]_Color1("Color 1", Color) = (0,0,0,0)
		[HDR]_Color2("Color 2", Color) = (0.6280277,0.7012647,0.9705882,0)
		_Distortion("Distortion", 2D) = "white" {}
		_DistortionScroll("Distortion Scroll", Range( 0 , 1)) = 0.524371
		_SpeedScroll("Speed Scroll", Range( 0 , 1)) = 0.4577202
		_ScaleSize("Scale Size", Range( 0 , 20)) = 0
		_ScaleSpeed("Scale Speed", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _ScaleSpeed;
		uniform float _ScaleSize;
		uniform sampler2D _MainTexture;
		uniform float4 _MainTexture_ST;
		uniform float4 _MainColor;
		uniform float4 _Color1;
		uniform float4 _Color2;
		uniform sampler2D _CutoutTexture;
		uniform sampler2D _Distortion;
		uniform float4 _Distortion_ST;
		uniform float _DistortionScroll;
		uniform float _SpeedScroll;
		uniform float _Color;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertexNormal = v.normal.xyz;
			v.vertex.xyz += ( ase_vertexNormal * max( ( sin( ( ( 0.0 + _Time.y ) / _ScaleSpeed ) ) / _ScaleSize ) , 0.0 ) );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_MainTexture = i.uv_texcoord * _MainTexture_ST.xy + _MainTexture_ST.zw;
			o.Albedo = ( tex2D( _MainTexture, uv_MainTexture ) * _MainColor ).rgb;
			float2 uv_Distortion = i.uv_texcoord * _Distortion_ST.xy + _Distortion_ST.zw;
			float2 panner11 = ( ( _Time.y * _SpeedScroll ) * float2( 1,0 ) + float2( 0,0 ));
			float2 uv_TexCoord9 = i.uv_texcoord + panner11;
			float4 lerpResult28 = lerp( _Color1 , _Color2 , float4( UnpackNormal( tex2D( _CutoutTexture, ( ( (tex2D( _Distortion, uv_Distortion )).rga * _DistortionScroll ) + float3( uv_TexCoord9 ,  0.0 ) ).xy ) ) , 0.0 ));
			float4 temp_cast_4 = (_Color).xxxx;
			o.Emission = ( pow( lerpResult28 , temp_cast_4 ) * _Color ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
}