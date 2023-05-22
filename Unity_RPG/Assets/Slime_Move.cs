using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Slime_Move : MonoBehaviour {

    bool Move = false;
    // Use this for initialization
    GameObject Target;
    Animator animator;
    void Start () {
        animator = GetComponent<Animator>();
	}

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag ==("Skill")|| other.gameObject.tag == ("Sword")|| other.gameObject.tag == ("Skill_Poision"))
        {
            Move = true;
            Target = GameObject.FindGameObjectWithTag("Player");
        }
    }

    // Update is called once per frame
    void Update () {

        if (Move)
        {

            Monster_ST call = gameObject.GetComponent<Monster_ST>();

            float Slime_HP = call.HP;
            Debug.Log(Slime_HP);

            if(Slime_HP <=0)
            {
                animator.SetInteger("ani", 4);
            }
        }
	}
}
