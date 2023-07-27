Shader "HOD_Disolve"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_DisolveTexture("Disolve Texture", 2D) = "white" {}
		_Disolve("Disolve", Range( 0 , 1)) = 0.2705882
		_MainTexture("Main Texture", 2D) = "white" {}
		_NormalTexture("Normal Texture", 2D) = "bump" {}
		_Metallic01("Metallic 0-1", Range( 0 , 1)) = 0
		_Smoothness01("Smoothness 0-1", Range( 0 , 1)) = 0
		_Normal10("Normal 1-0", Range( 0 , 1)) = 1
		_Emission("Emission", 2D) = "white" {}
		[HDR]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		[HDR]_MainColor("Main Color ", Color) = (1,1,1,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _NormalTexture;
		uniform float4 _NormalTexture_ST;
		uniform float _Normal10;
		uniform sampler2D _MainTexture;
		uniform float4 _MainTexture_ST;
		uniform float4 _MainColor;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float4 _EmissionColor;
		uniform float _Metallic01;
		uniform float _Smoothness01;
		uniform float _Disolve;
		uniform sampler2D _DisolveTexture;
		uniform float4 _DisolveTexture_ST;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_NormalTexture = i.uv_texcoord * _NormalTexture_ST.xy + _NormalTexture_ST.zw;
			o.Normal = ( UnpackNormal( tex2D( _NormalTexture, uv_NormalTexture ) ) + _Normal10 );
			float2 uv_MainTexture = i.uv_texcoord * _MainTexture_ST.xy + _MainTexture_ST.zw;
			o.Albedo = ( tex2D( _MainTexture, uv_MainTexture ) * _MainColor ).rgb;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			o.Emission = ( tex2D( _Emission, uv_Emission ) * _EmissionColor ).rgb;
			o.Metallic = _Metallic01;
			o.Smoothness = _Smoothness01;
			o.Alpha = 1;
			float2 uv_DisolveTexture = i.uv_texcoord * _DisolveTexture_ST.xy + _DisolveTexture_ST.zw;
			clip( ( (-0.6 + (( 1.0 - _Disolve ) - 0.0) * (0.6 - -0.6) / (1.0 - 0.0)) + tex2D( _DisolveTexture, uv_DisolveTexture ) ).r - _Cutoff );
		}

		ENDCG
	}
}