using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Character_Camera : MonoBehaviour {

    public Transform player;
    //Vector3 oldPos = Vector3.zero;

    public float dist = 10f;
    public float height = 8f;

    private Transform tr;
    //public GameObject player;
    void Start()
    {
        //트롤에 붙어있는 Player라는 컴포넌트를 가져와 tmp에 저장
        //Player tmp = player.GetComponent<Player>();
        //Debug.Log(tmp.transform.position); // 캐릭터의 위치

        //Player tmp = player.GetComponent<Player>();

        tr = GetComponent<Transform>();


        //BoxCollider box =  player.gameObject.AddComponent<BoxCollider>();
        //Destroy(box);

        //Debug.Log(player.transform.position);

    }

    // Update is called once per frame
    void Update()
    {



    }


    void LateUpdate()
    {

        tr.position = player.position - (1 * Vector3.forward * dist) + (Vector3.up * height);
        tr.LookAt(player);


        //Vector3 delta = player.transform.position - oldPos;
        //transform.position = transform.position + delta;
        //oldPos = player.transform.position;
    }
}
