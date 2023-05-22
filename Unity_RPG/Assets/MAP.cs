using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class MAP : MonoBehaviour {

    public GameObject player;
    public ScrollRect scrollRc;

    public RectTransform mobTr;

    //3차원 공간상의 실제 맵 크기
    float mapXsize = 100;
    float mapZsize = 100;

    float x = 0;

    void Start()
    {
        // 스크롤 뷰에서 위치를 조종할 수 있는 변수
        // scrollRect의 nolmalizedPosition변수를 사용 조종 가능하다.

        // 스크롤 뷰의 정 중앙의 위치는 0.5, 0.5
        scrollRc.normalizedPosition = new Vector2(0.5f, 0.5f);

    }

    Vector2 Get2DMapPosition()
    {
        Vector3 tmp = player.transform.position;

        //offset
        //미니맵의 중앙 점은 0,0은 이미지의 중앙점
        //캐릭터의 0,0은 월드 공간상의 0,0
        tmp.x += 50;
        tmp.z += 50;

        //캐릭터 위치의 비율을 계산
        float xRatio = tmp.x / mapXsize;
        float zRatio = tmp.z / mapZsize;

        Vector2 minimapPos = Vector2.zero;
        minimapPos.Set(xRatio, zRatio);

        return minimapPos;
    }

    // Update is called once per frame
    void Update()
    {
        x += Time.deltaTime * 0.1f;
        scrollRc.normalizedPosition = Get2DMapPosition();
    }
}
