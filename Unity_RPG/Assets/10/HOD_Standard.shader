Shader "HOD_Standard"
{
	Properties
	{
		_TextureSample1("nm1", 2D) = "bump" {}
		_TextureSample0("tex1", 2D) = "white" {}
		_nm2("nm2", 2D) = "bump" {}
		_tex2("tex2", 2D) = "white" {}
		_Overlay("Overlay", 2D) = "white" {}
		[HDR]_Mask("Mask", Range( 0 , 1)) = 0.3176471
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[HDR]_HDRColor("HDR Color", Color) = (1,0,0,0)
		_Metellic("Metellic", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _TextureSample1;
		uniform float4 _TextureSample1_ST;
		uniform sampler2D _nm2;
		uniform float4 _nm2_ST;
		uniform sampler2D _Overlay;
		uniform float4 _Overlay_ST;
		uniform float _Mask;
		uniform float4 _HDRColor;
		uniform sampler2D _TextureSample0;
		uniform float4 _TextureSample0_ST;
		uniform sampler2D _tex2;
		uniform float4 _tex2_ST;
		uniform float _Metellic;
		uniform float _Smoothness;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TextureSample1 = i.uv_texcoord * _TextureSample1_ST.xy + _TextureSample1_ST.zw;
			float2 uv_nm2 = i.uv_texcoord * _nm2_ST.xy + _nm2_ST.zw;
			float2 uv_Overlay = i.uv_texcoord * _Overlay_ST.xy + _Overlay_ST.zw;
			float4 temp_output_18_0 = ( tex2D( _Overlay, uv_Overlay ) * _Mask );
			float3 lerpResult10 = lerp( UnpackNormal( tex2D( _TextureSample1, uv_TextureSample1 ) ) , UnpackNormal( tex2D( _nm2, uv_nm2 ) ) , temp_output_18_0.rgb);
			o.Normal = lerpResult10;
			float2 uv_TextureSample0 = i.uv_texcoord * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
			float2 uv_tex2 = i.uv_texcoord * _tex2_ST.xy + _tex2_ST.zw;
			float4 lerpResult9 = lerp( tex2D( _TextureSample0, uv_TextureSample0 ) , tex2D( _tex2, uv_tex2 ) , temp_output_18_0);
			o.Albedo = ( _HDRColor * lerpResult9 ).rgb;
			o.Metallic = _Metellic;
			o.Smoothness = _Smoothness;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}