// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "HOD_RimWave"
{
	Properties
	{
		_MainColor("Main Color", Color) = (1,1,1,0)
		_NormalSpeed("Normal Speed", Float) = 0.2
		_NormalTexture("Normal Texture", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Range( 0 , 1)) = 0.1064283
		_RimColor("Rim Color", Color) = (1,0.3897059,0.3897059,0)
		_Depth("Depth", Float) = 0.4
		_RimScale("Rim Scale", Float) = 1
		_RimPower("Rim Power", Float) = 2.3
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Pass
		{
			ColorMask 0
			ZTest Always
			ZWrite On
		}

		Tags{ "RenderType" = "Transparent"  "Queue" = "Geometry+0" }
		Cull Off
		ZWrite On
		Offset  0 , 0
		GrabPass{ }
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
			float4 screenPos;
			float3 worldPos;
			float3 worldNormal;
		};

		uniform sampler2D _GrabTexture;
		uniform float _NormalStrength;
		uniform sampler2D _NormalTexture;
		uniform float _NormalSpeed;
		uniform float4 _MainColor;
		uniform float4 _RimColor;
		uniform float _RimScale;
		uniform float _RimPower;
		uniform sampler2D _CameraDepthTexture;
		uniform float _Depth;


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
			float mulTime14 = _Time.y * _NormalSpeed;
			float cos10 = cos( mulTime14 );
			float sin10 = sin( mulTime14 );
			float2 rotator10 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos10 , -sin10 , sin10 , cos10 )) + float2( 0.5,0.5 );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float4 screenColor6 = tex2D( _GrabTexture, ( float4( UnpackScaleNormal( tex2D( _NormalTexture, rotator10 ), _NormalStrength ) , 0.0 ) + ase_grabScreenPosNorm ).xy );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV23 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode23 = ( 0.0 + _RimScale * pow( 1.0 - fresnelNdotV23, _RimPower ) );
			float4 lerpResult1 = lerp( ( (screenColor6).rgba * _MainColor ) , ( _RimColor * pow( fresnelNode23 , _RimColor.r ) ) , fresnelNode23);
			o.Albedo = lerpResult1.rgb;
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float screenDepth20 = LinearEyeDepth(UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture,UNITY_PROJ_COORD( ase_screenPos ))));
			float distanceDepth20 = abs( ( screenDepth20 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _Depth ) );
			o.Alpha = saturate( distanceDepth20 );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15606
935;143;981;917;2880.604;1212.505;2.595445;True;False
Node;AmplifyShaderEditor.RangedFloatNode;17;-2277.716,-145.3864;Float;False;Property;_NormalSpeed;Normal Speed;2;0;Create;True;0;0;False;0;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;15;-2050.719,-314.9328;Float;False;Constant;_Vector0;Vector 0;2;0;Create;True;0;0;False;0;0.5,0.5;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;16;-2074.321,-566.9187;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;14;-2041.624,-52.71012;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;10;-1787.939,-372.7622;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-1787.94,-166.1772;Float;False;Property;_NormalStrength;Normal Strength;4;0;Create;True;0;0;False;0;0.1064283;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;9;-1371.881,-179.8612;Float;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;8;-1435.386,-365.9151;Float;True;Property;_NormalTexture;Normal Texture;3;0;Create;True;0;0;False;0;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;25;-760.3968,439.5001;Float;False;Property;_RimPower;Rim Power;8;0;Create;True;0;0;False;0;2.3;2.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-770.2968,223.2137;Float;False;Property;_RimScale;Rim Scale;7;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;7;-1015.158,-270.9266;Float;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FresnelNode;23;-545.5866,345.7473;Float;False;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;6;-795.6664,-300.6984;Float;False;Global;_GrabScreen0;Grab Screen 0;0;0;Create;True;0;0;False;0;Object;-1;False;False;1;0;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;19;-659.9387,23.9695;Float;False;Property;_RimColor;Rim Color;5;0;Create;True;0;0;False;0;1,0.3897059,0.3897059,0;1,0.3897059,0.3897059,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;22;-197.2757,438.3911;Float;False;Property;_Depth;Depth;6;0;Create;True;0;0;False;0;0.4;0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;5;-595.791,-352.2784;Float;False;True;True;True;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;4;-579.3013,-160.1593;Float;False;Property;_MainColor;Main Color;1;0;Create;True;0;0;False;0;1,1,1,0;1,0.5294118,0.5294118,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;26;-464.4151,142.4471;Float;False;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-309.5161,-200.0662;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DepthFade;20;-26.48298,420.8117;Float;False;True;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-252.1028,10.2561;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;18;-20.38098,202.1005;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1;-61.09461,-62.9996;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;176,-52;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;HOD_RimWave;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;7;Custom;0.5;True;False;0;True;Transparent;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;14;0;17;0
WireConnection;10;0;16;0
WireConnection;10;1;15;0
WireConnection;10;2;14;0
WireConnection;8;1;10;0
WireConnection;8;5;12;0
WireConnection;7;0;8;0
WireConnection;7;1;9;0
WireConnection;23;2;24;0
WireConnection;23;3;25;0
WireConnection;6;0;7;0
WireConnection;5;0;6;0
WireConnection;26;0;23;0
WireConnection;26;1;19;0
WireConnection;2;0;5;0
WireConnection;2;1;4;0
WireConnection;20;0;22;0
WireConnection;3;0;19;0
WireConnection;3;1;26;0
WireConnection;18;0;20;0
WireConnection;1;0;2;0
WireConnection;1;1;3;0
WireConnection;1;2;23;0
WireConnection;0;0;1;0
WireConnection;0;9;18;0
ASEEND*/
//CHKSM=D60470A2D3594B23384ECD297B59A1E5CECA5307