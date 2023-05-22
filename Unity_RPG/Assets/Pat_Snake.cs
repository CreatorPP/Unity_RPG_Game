using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pat_Snake : MonoBehaviour {


    float h;
    float v;

    Animator animator;

    public Transform target;



    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
       // transform.LookAt(target);
        animator.SetInteger("Pat_Ani", 1);


    }
}
