using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CustomCamera : MonoBehaviour {

    // Use this for initialization
    public Transform target;
	void Start () {
        iTween.MoveTo(this.gameObject, iTween.Hash("path", iTweenPath.GetPath("CamPath"), "easeType", "easeOutCirc", "time", 20f, /*"looktarget", target,*/ "oncomplete", "MoveEnd"));
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
