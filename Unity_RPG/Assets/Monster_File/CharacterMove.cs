using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterMove : MonoBehaviour
{


    public float Speed = 1.0f;
    public GameObject Target;

    GameObject Player;
    public GameObject Monster;

    float TimeLeft = 4.0f;
    float nextTime = 0.0f;
    int count = 0;  

    bool PlayerDie = false;


    Animator animator;

    float dis = 0.0f;

    public float attk;

    public GameObject spher;

    bool MobAt = false;
    bool Mob_Die = true;

    // Use this for initialization
    Vector3 MonsterReset;
    void Start()
    {
        spher.GetComponent<SphereCollider>().enabled = false;
    }



    private void Awake()
    {
        Player = GameObject.FindGameObjectWithTag("Player");
        //Monster = GameObject.FindGameObjectWithTag("Monster");

        MonsterReset = transform.position;

        animator = GetComponent<Animator>();
    }


    void AnimationUpdate()
    {
        if (transform.position.x == 0 && transform.position.z == 0)
        {
            animator.SetInteger("Trollani", 0);
        }
    }


    void aaa()
    {
        transform.position = Vector3.MoveTowards(transform.position, MonsterReset, 2 * Time.deltaTime);
        PlayerDie = true;
        transform.LookAt(MonsterReset);
    }
    // Update is called once per frame
    void Update()
    {
        AnimationUpdate();

        if (Mob_Die)
        {


            Vector3 dir = Target.transform.position - transform.position;

            dir.Normalize();

            //transform.position += dir * Speed * Time.deltaTime;

            float distance = Vector3.Distance(Target.transform.position, transform.position);

            CharacterAttribute targetAttribute = Target.GetComponent<CharacterAttribute>();
            CharacterAttribute myAttribute = gameObject.GetComponent<CharacterAttribute>();
            Character myPlayer = Player.GetComponent<Character>();

            dis = Vector3.Distance(Player.transform.position, Monster.transform.position);

            if (distance <= 6 && PlayerDie == false && Mob_Die)
            {
                nextTime += Time.deltaTime;
                this.transform.rotation = Quaternion.Lerp(this.transform.rotation, Quaternion.LookRotation(dir), 5 * Time.deltaTime);

                //transform.LookAt(Target.transform);
                if (distance > targetAttribute.Radius + myAttribute.Radius)
                {
                    transform.position += (dir * Speed * Time.deltaTime);
                    MobAt = true;
                    animator.SetInteger("Trollani", 1);



                }
                else if (distance <= targetAttribute.Radius + myAttribute.Radius)
                {
                    animator.SetInteger("Trollani", 0);
                    if (myPlayer.Player_HP <= 0)
                    {
                        Invoke("aaa", 1);

                        if (transform.position == MonsterReset)
                        {
                            animator.SetInteger("Trollani", 0);
                        }
                    }

                    if (MobAt && nextTime > TimeLeft)
                    {

                        Attack(targetAttribute, myAttribute);
                        nextTime = 0;

                    }

                }




            }
            else if (transform.position.x > MonsterReset.x || Monster.transform.position.z > MonsterReset.z)
            {
                Vector3 a = transform.position;

                transform.position = Vector3.MoveTowards(transform.position, MonsterReset, 2 * Time.deltaTime);

                transform.LookAt(MonsterReset);

                if (transform.position == MonsterReset)
                {
                    animator.SetInteger("Trollani", 0);
                }
            }
            else
            {
                Vector3 a = transform.position;

                transform.position = Vector3.MoveTowards(transform.position, MonsterReset, 2 * Time.deltaTime);

                transform.LookAt(MonsterReset);

                if (transform.position == MonsterReset)
                {
                    animator.SetInteger("Trollani", 0);
                }
            }

            Monster_ST call = this.GetComponent<Monster_ST>();
            float ccc = call.HP;

            //Debug.Log(ccc);

            if (ccc == 0)
            {
                animator.SetInteger("Trollani", 444);
                Invoke("Die", 3.0f);
            }

        }
    }


    void Die()
    {
        Monster.SetActive(false);
        Mob_Die = false;
    }




    void spher_ON()
    {
        spher.GetComponent<SphereCollider>().enabled = true;
    }
    void spher_OFF()
    {
        spher.GetComponent<SphereCollider>().enabled = false;
    }
    void Attack(CharacterAttribute targetAttribute, CharacterAttribute myAttribute)
    {
        if(count<5)
        {
            targetAttribute.HP -= myAttribute.AttackPower;
            animator.SetInteger("Trollani", 2);
            Invoke("spher_ON", 0.2f);
            Invoke("spher_OFF", 0.5f);
            attk = 10.0f;
            count += 1;
        }
        else if(count>=5)
        {
            targetAttribute.HP -= myAttribute.AttackPower+2;
            animator.SetInteger("Trollani", 22);
            //Debug.Log(targetAttribute.HP);
            count = 0;
        }
    }
}
