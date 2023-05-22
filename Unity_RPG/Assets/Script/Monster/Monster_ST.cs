using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Monster_ST : MonoBehaviour
{


    public float HP;
    public string Name;

    public float Hit_Damage;

    public bool Hit_ON;


    public Image Monster_HPBar;
    public Text Monster_HPText;

    Image SlimeBar;
    Image TrollBar;
    float Slime_Start_HP;
    float Troll_Start_HP;

    float Slime_Hit_HP;
    float Troll_Hit_HP;

    public float HP_fill;

    GameObject Hit_Monster;
    // Use this for initialization
    Character call;

    GameObject Player;

    float Times = 0.0f;


    public Image Monster_Bar;


    Animator animator;
    private void Awake()
    {
        Player = GameObject.FindGameObjectWithTag("Player");
        call = Player.GetComponent<Character>();
        HP_fill = 1.0f;
        animator = GetComponent<Animator>();

    }

    void Start()
    {
        if (this.gameObject.name.Equals("Slime"))
        {
            Slime_Start_HP = 50f;
            HP = 50f;
            Name = "슬라임";
        }
        else if (this.gameObject.name.Equals("Troll"))
        {
            Troll_Start_HP = 250f;
            HP = 250f;
            Name = "트롤";
        }
    }
    bool poision = false;
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Skill")
        {

            Character call = Player.GetComponent<Character>();
            Hit_ON = true;
            Hit_Damage = call.attack_skill;

            Hit_Monster = other.gameObject;

        }

        if(other.gameObject.tag=="Sword")
        {
            GameObject Sword = GameObject.FindGameObjectWithTag("Sword");
            Sword_Script asd = Sword.GetComponent<Sword_Script>();
            
            Hit_Damage = asd.Damage;
            Hit_ON = call.Hit_On;
        }
       
    }
    private void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Skill_Poision")
        {
            Hit_ON = true;
            Hit_Damage = 1f;
        }
    }


    // Update is called once per frame

    void Die()
    {
        this.gameObject.SetActive(false);
    }
    void Update()
    {

        if (Hit_ON&& this.gameObject.name.Equals("Slime"))
        {
            
            Slime_Hit_HP = HP - Hit_Damage;
            HP_fill = Slime_Hit_HP / Slime_Start_HP;
            Monster_HPBar.fillAmount = HP_fill;

            Monster_HPText.text = string.Format("{0}/{0}", HP, Slime_Start_HP);
            HP -= Hit_Damage;
            Hit_ON = false;
            //Debug.Log(HP);
            if (HP <= 0)
            {
                Invoke("MonsterBar_OFF", 1.0f);
                HP = 0;
                Debug.Log("죽음");
                Invoke("Die", 3.0f);

            }

        }
        if (Hit_ON&& this.gameObject.name.Equals("Troll"))
        {
            
            Troll_Hit_HP = HP - Hit_Damage;
            HP_fill = Troll_Hit_HP / Troll_Start_HP;
            Monster_HPBar.fillAmount = HP_fill;
            Monster_HPText.text = string.Format("{0}/{0}", HP, Troll_Start_HP);
            HP -= Hit_Damage;

            Hit_ON = false;
            //Debug.Log(HP);
            if(HP<=0)
            {
                Invoke("MonsterBar_OFF", 1.0f);
                HP = 0;
            }
            


        }

    }
    
    void MonsterBar_OFF()
    {

        Monster_Bar.gameObject.SetActive(false);
    }
}
