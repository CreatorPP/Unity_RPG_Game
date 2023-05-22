using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Snake : MonoBehaviour
{
    // Start is called before the first frame update

    public GameObject FlowObj;
    Vector3 dir;
    public float fSpeed = 10f;


    void Start()
    {
        dir = FlowObj.transform.position - transform.position;
        float fAngle = Vector3.Angle(transform.forward, dir.normalized);
        Debug.Log(fAngle.ToString());



    }

    // Update is called once per frame
    void Update()
    {

        float fDistance = Vector3.Distance(transform.position, FlowObj.transform.position);
        dir = FlowObj.transform.position - transform.position;

        //time += Time.deltaTime;

        if (fDistance >= 1f)
        {
            transform.Translate(dir * Time.deltaTime * fSpeed);
            transform.LookAt(FlowObj.transform);
        }
        else
        {
            transform.position = transform.position;
        }





    }
}
