using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Character : MonoBehaviour
{

    //마우스로 클릭한지점을 저장할 함수


    Transform Player_Start_Position;

    Vector3 vEnd = Vector3.zero;
    public float fSpeed = 5;

    GameObject Target = null;
    Animator ani;

    Animator animator;

    public GameObject sword;
    public GameObject sword_off;

    float h;
    float v;

    int count = 0;

    bool Potal;

    public Image Inventory;

    GameObject particle_buff_start;
    GameObject particle_buff_start02;
    GameObject particle_buff_start03;
    GameObject particle_buff_start04;

    //파티클//
    public GameObject particle_buff;
    public GameObject particle_buff02;
    public GameObject particle_buff03;
    public GameObject particle_buff04;

    public Image MAP;

    //스킬창 부분//
    bool bBegin = false;
    bool BuffbBegin = false;

    float Hit_damage;
    public float Player_Start_HP;

    bool MonsterTagetON = false;

    GameObject MonsterTaget;
    Transform MonsterTaget_po;

    bool Map_ON;

    /// <summary>
    ///     


    public Image Coolgauge;
    public Image BuffCoolgague;
    public Image BuffCoolgague_2;
    public Image BuffCoolgague_3;


    bool buff1 = false;
    float buff1_start = 0.0f;
    float buff1_coolTime = 15.0f;

    bool buff2 = false;
    float buff2_start = 0.0f;
    float buff2_coolTime = 8.0f;

    bool buff3 = false;
    float buff3_start = 0.0f;
    float buff3_coolTime = 5.0f;



    float fTimeSum = 0;
    float fCoolTime = 5.0f;
    float BuffCool = 20.0f;
    /// </summary>
    /// 

    public Image Monster_ST;
    public Text Monster_Text_Name;
    public Text Monster_Text_HP;
    public Image Monster_Image_HPBar;


    public Image Player_HPBar;
    public float Player_HP;
    public float Player_MP;


    /// <summary>

    float Monster_HP;
    string Monster_Name;
    /// </summary>


    public float attack_skill;
    public float attak_Slash;

    public bool Hit_On;

    public Image Player_MPBar;
    float Playerp_Start_MP;

    GameObject Player;
    public GameObject Sword;
    void Awake()
    {
        //인스턴스가 생성될때 한번 호출
        Debug.Log("Awake");
        animator = GetComponent<Animator>();

        Player_Start_Position = transform;

        Debug.Log(Player_Start_Position);

        Player = GameObject.FindGameObjectWithTag("Player");

        Hit_On = false;

        Player_HP = 100;
        Player_Start_HP = 100;
        Player_MP = 100;
        Playerp_Start_MP = 100;
        Map_ON = false;
    }

    bool Monster_Update_ST = false;
    void MousePicking()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                if (hit.collider.CompareTag("Monster"))
                {
                    Debug.Log("몬스터입니다");

                    MonsterTaget_po = hit.transform;

                    MonsterTaget = hit.transform.gameObject;
                    MonsterTagetON = true;

                    Monster_ST call = MonsterTaget.GetComponent<Monster_ST>();

                    Monster_ST.gameObject.SetActive(true);

                    Monster_HP = call.HP;
                    Monster_Name = call.Name;

                    Monster_Text_Name.GetComponent<Text>().text = Monster_Name;
                    Monster_Text_HP.GetComponent<Text>().text = Monster_HP.ToString();
                    call.Monster_HPBar.fillAmount = 1.0f;

                    Monster_Update_ST = true;

                    Debug.Log(Monster_Name);
                    Debug.Log(Monster_HP);
                    Debug.Log(MonsterTaget.gameObject.name);
                }
                else
                {
                    Debug.Log("아무것도 아닙니다");
                    MonsterTagetON = false;
                    Monster_ST.gameObject.SetActive(false);
                    Monster_Update_ST = false;
                }
            }
        }
    }
    bool InventoryBool = true;
    void Inventory_ON()
    {
        if (Input.GetKeyDown(KeyCode.I) && InventoryBool)
        {
            Inventory.gameObject.SetActive(true);
            InventoryBool = false;
        }
        else if (Input.GetKeyDown(KeyCode.I) && !InventoryBool)
        {
            Inventory.gameObject.SetActive(false);
            InventoryBool = true;
        }
    }

    //유니티 이벤트 함수
    void Start()
    {
        //화면에 랜더링 되기 직전에 한번 호출
        vEnd = transform.position;
        ani = GetComponent<Animator>();

    }

    void OnEnable()
    {
        //게임오브젝트가 활성화될때 호출
    }

    void OnDisable()
    {
        //게임오브젝트가 비활성화 될때 호출
    }

    void FixedUpdate()
    {
        //물리가 업데이트 될때 
    }




    /// <summary>
    /// ////////////////////////////////////////////////키보드 움직이는거/////////////////////////////////////////////
    /// </summary>
    /// 
    bool MoveStop_Bool = true;
    void MoveStop()
    {
        MoveStop_Bool = true;
    }

    float Player_Hit_HP;
    float Player_HP_fill;
    float Player_Recovery;

    float Player_Hit_MP;
    float Player_MP_fill;
    float Player_MP_Consume;

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag==("Monster_sw"))
        {
            Debug.Log("맞는중");
            GameObject Mob = other.gameObject;

            

            Hit_damage = 10.0f;
            Player_Hit_HP = Player_HP - Hit_damage;
            Player_HP_fill = Player_Hit_HP / Player_Start_HP;

            Player_HPBar.fillAmount = Player_HP_fill;
            Player_HP -= Hit_damage;







        }

        if(other.gameObject.tag==("Recovery"))
        {
            Invoke("Recovery", 0.5f);
        }
        if(other.gameObject.tag==("trr_hill"))
        {
            Player_HP = Player_Start_HP;
            Player_HP_fill = Player_HP / Player_Start_HP;

        }
    }
    void Recovery()
    {
        Player_Recovery = 20.0f;
        Player_Hit_HP = Player_HP + Player_Recovery;
        Player_HP_fill = Player_Hit_HP / Player_Start_HP;
        Player_HPBar.fillAmount = Player_HP_fill;
        Player_HP += Player_Recovery;
    }
    void KeyMove()
    {
        //GetAxis함수는 - 1에서 1까지의 결과를 리턴
        // Horizontal 가 축이름 이라면
        // 왼쪽으로 이동하면 음수 오른쪽으로 이동하면 양수를 리턴
        //움직이지 않으면 0

        if (MoveStop_Bool)
        {


            h = Input.GetAxis("Horizontal");
            v = Input.GetAxis("Vertical");

            float x = h * Time.deltaTime * 200;
            float y = v * Time.deltaTime * 4;

            transform.Translate(0, 0, y); // x 0 y 아래 위로 안움직여지고 앞뒤  xy0 아래 위로 움직여짐  
            transform.Rotate(0, x, 0);
        }



    }

    void AnimationUpdate()
    {
        if (h == 0 && v == 0)
        {
            animator.SetBool("isRunning", false);
            animator.SetInteger("lani", 0);
        }
        else
        {
            animator.SetBool("isRunning", true);
            animator.SetInteger("lani", 1);
        }
    }

    bool SwordON = false;

    void StartSword()
    {
        sword.SetActive(true);

        sword_off.SetActive(false);
        SwordON = true; 
    }


    void Slash()
    {

        if (Input.GetKeyDown(KeyCode.Space) && count == 0)
        {

            MoveStop_Bool = false;

            Debug.Log(MoveStop_Bool);
            

            animator.SetInteger("lani", 20);
            Invoke("StartSword", 0.5f);
            Invoke("MoveStop", 1.5f);
            count = 1;


        }
        else if (Input.GetMouseButtonDown(1) && count == 1)
        {
            animator.SetInteger("lani", 2);
            count = 2;
            attak_Slash = 10.0f;
            Hit_On = true;

            Debug.Log(Hit_On);
            Debug.Log("히트");
            Sword.GetComponent<MeshCollider>().enabled = true;
            Invoke("SwordColliderOFF",0.5f);
        }
        else if (Input.GetMouseButtonDown(1) && count == 2)
        {
            animator.SetInteger("lani", 3);
            count = 1;
        }


    }

    void SwordColliderOFF()
    {
        Sword.GetComponent<MeshCollider>().enabled = false;
    }





    void Skill()
    {
        if (Input.GetKeyDown(KeyCode.Q) && SwordON&& MonsterTagetON&& Coolgauge.fillAmount <= 0)
        {
            animator.SetInteger("lani", 7777);

            Invoke("buff04", 1.3f);
            MoveStop_Bool = false;
            Invoke("MoveStop", 2.8f);
            bBegin = true;

            Hit_On = true;
            attack_skill = 5.0f;

        }
        else if (Input.GetKeyDown(KeyCode.E) && BuffCoolgague.fillAmount <= 0)
        {
            animator.SetInteger("lani", 90);

            Invoke("buff", 0.5f);
            MoveStop_Bool = false;
            Invoke("MoveStop", 2.8f);
            BuffbBegin = true;
            buff1 = true;




        }
        else if (Input.GetKeyDown(KeyCode.Alpha1) && BuffCoolgague_2.fillAmount <= 0)
        {
            animator.SetInteger("lani", 90);
            Player_MP_Consume = 20.0f;
            Player_Hit_MP = Player_MP - Player_MP_Consume;
            Player_MP_fill = Player_Hit_MP / Playerp_Start_MP;

            Player_MPBar.fillAmount = Player_MP_fill;
            Player_MP -= Player_MP_Consume;


            Invoke("buff02", 0.0000001f);

            MoveStop_Bool = false;

            Debug.Log(MoveStop_Bool);
            Invoke("MoveStop", 2.8f);

            BuffbBegin = true;
            

            buff2 = true;




        }
        else if (Input.GetKeyDown(KeyCode.Alpha2) && SwordON&&MonsterTagetON && BuffCoolgague_3.fillAmount <= 0)
        {
            animator.SetInteger("lani", 8888);


            Player_MP_Consume = 10.0f;
            Player_Hit_MP = Player_MP - Player_MP_Consume;
            Player_MP_fill = Player_Hit_MP / Playerp_Start_MP;

            Player_MPBar.fillAmount = Player_MP_fill;
            Player_MP -= Player_MP_Consume;

            Invoke("buff03", 0.5f);

            MoveStop_Bool = false;

            Debug.Log(MoveStop_Bool);
            Invoke("MoveStop", 2.8f);


            BuffbBegin = true;

            attack_skill = 50.0f;
            buff3 = true;
            Hit_On = true;
           


        }
    }
    /// <summary>
    /// ////////////////////////////////////////////////키보드 움직이는거/////////////////////////////////////////////
    /// </summary>
    /// 

    void buff()
    {
        particle_buff_start = Instantiate(particle_buff, new Vector3(transform.position.x, transform.position.y + 0.5f, transform.position.z), Quaternion.identity);

        Destroy(particle_buff_start, 2);
    }

    void buff02()
    {
        particle_buff_start02 = Instantiate(particle_buff02, new Vector3(transform.position.x, transform.position.y, transform.position.z), Quaternion.identity);

        Destroy(particle_buff_start02, 2);


    }

    void buff03()
    {
        particle_buff_start03 = Instantiate(particle_buff03, new Vector4(MonsterTaget_po.position.x, MonsterTaget_po.position.y, MonsterTaget_po.position.z), Quaternion.identity);


        particle_buff_start03.transform.rotation = Quaternion.Euler(-90, 0, 0);
        Destroy(particle_buff_start03, 2);
    }
    void buff04()
    {
        particle_buff_start04 = Instantiate(particle_buff04, new Vector3(MonsterTaget.transform.position.x, MonsterTaget.transform.position.y, MonsterTaget.transform.position.z), Quaternion.identity);
        
        Destroy(particle_buff_start04, 4);
    }

    void SwordOff()
    {

        if (Input.GetKeyDown(KeyCode.R))
        {
            sword.SetActive(false);
            count = 0;

            sword_off.SetActive(true);
            SwordON = false;
        }
    }

    void Player_Die()
    {
        if(Player_HP ==0)
        {
            animator.SetInteger("lani", 44444);
            MoveStop_Bool = false;
        }
    }

    void Map()
    {
        if(Input.GetKeyDown(KeyCode.M)&& Map_ON)
        {
            MAP.gameObject.SetActive(true);
            Map_ON = false;
        }
        else if (Input.GetKeyDown(KeyCode.M) && !Map_ON)
        {
            MAP.gameObject.SetActive(false);
            Map_ON = true;
        }

    }

    void Update()
    {

        KeyMove();
        AnimationUpdate();
        Slash();
        SwordOff();
        Skill();
        MousePicking();
        Inventory_ON();
        Player_Die();
        Map();

        if (Monster_Update_ST)
        {
            Monster_ST call = MonsterTaget.GetComponent<Monster_ST>();
            Monster_HP = call.HP;
            Monster_Text_HP.GetComponent<Text>().text = Monster_HP.ToString();

            call.Monster_HPBar.fillAmount = call.HP_fill;


        }

        if (bBegin == true)
        {

            fTimeSum += Time.deltaTime;
            Coolgauge.fillAmount = (fCoolTime - fTimeSum) / fCoolTime;
            if (Coolgauge.fillAmount <= 0)
            {
                bBegin = false;
                fTimeSum = 0f;
            }


        }
        if (buff1 == true)
        {
            //쿨타임 - 시간증가 / 20초
            buff1_start += Time.deltaTime;
            BuffCoolgague.fillAmount = (buff1_coolTime - buff1_start) / buff1_coolTime;
            if (BuffCoolgague.fillAmount <= 0)
            {
                buff1 = false;
                buff1_start = 0f;
            }
        }
        if (buff2 == true)
        {
            buff2_start += Time.deltaTime;
            BuffCoolgague_2.fillAmount = (buff2_coolTime - buff2_start) / buff2_coolTime;
            if (BuffCoolgague_2.fillAmount <= 0)
            {
                buff2 = false;
                buff2_start = 0f;
            }
        }
        if (buff3 == true)
        {
            buff3_start += Time.deltaTime;
            BuffCoolgague_3.fillAmount = (buff3_coolTime - buff3_start) / buff3_coolTime;
            if (BuffCoolgague_3.fillAmount <= 0)
            {
                buff3 = false;
                buff3_start = 0f;
            }
        }
    }

    void Move()
    {




        if (Target != null)
        {

            if (transform.position != vEnd)
            {
                transform.position = Vector3.MoveTowards(transform.position, vEnd, Time.deltaTime * fSpeed);
            }

            float distance = Vector3.Distance(transform.position, Target.transform.position);
            if (distance <= 2.0f)
            {
                ani.SetInteger("lani", 1);
                vEnd = transform.position;
            }

        }

        else
        {
            if (transform.position != vEnd)
            {
                transform.position = Vector3.MoveTowards(transform.position, vEnd, Time.deltaTime * fSpeed);
            }

            else if (transform.position == vEnd)
            {
                ani.SetInteger("lani", 0);
                animator.SetBool("isRunning", false);
            }
        }



        Vector3 vEnddir = vEnd - transform.position;

        Vector3 newDir = Vector3.RotateTowards(transform.forward, vEnddir, Time.deltaTime * 10, 0);

        transform.rotation = Quaternion.LookRotation(newDir);
    }

    void LateUpdate()
    {
        //제일 마지막에 호출되는 update
        //카메라 업데이트할때 주로 사용
    }

}
