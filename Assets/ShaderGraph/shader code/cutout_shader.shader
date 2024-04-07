Shader "Universal Render Pipeline/CustomCutoutShader" {
    Properties {
        _Cutoff ("Alpha Cutoff", Range (0.0, 1.0)) = 0.5
    }

    SubShader {
        Tags { "RenderType"="Opaque" }
        Blend Off
        LOD 200

        Pass {
            Stencil {
                Ref 1
                Comp always
                Pass replace
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata_t {
                float4 vertex : POSITION;
            };

            struct v2f {
                float4 vertex : SV_POSITION;
            };

            fixed _Cutoff;

            v2f vert (appdata_t v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            half4 frag () : SV_Target {
                return half4(1, 1, 1, 1);
            }
            ENDCG
        }
    }
}
