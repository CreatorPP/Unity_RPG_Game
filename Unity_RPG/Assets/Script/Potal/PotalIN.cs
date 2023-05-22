using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PotalIN : MonoBehaviour {

    

    

    public Transform TranslatePosition;


    public static bool a;
    Character playerlogic;

    GameObject Player;
    Transform ParentTransform;

    public Image GButton;
    public Image PotalImage;
    public Image Potalgague;


    public GameObject Portal_Particle;

    GameObject Particle_Go;
    GameObject Particle_Stop;
    private void Awake()
    {
        Player = GameObject.FindGameObjectWithTag("Player");
        playerlogic = Player.GetComponent<Character>();



    }


    private void OnTriggerEnter(Collider _col)
    {

        if (_col.gameObject.tag == "Player")
        {
            ParentTransform = _col.transform;
            a = true;

            GButton.gameObject.SetActive(true);
           

        }
        else
        {
            ParentTransform = null;
        }

    }

    private void PotalMove()
    {

        ParentTransform.position = TranslatePosition.position;
        ParentTransform.rotation = TranslatePosition.rotation;
        GButton.gameObject.SetActive(false);
        ParentTransform = null;
        a = false;
        Particle_Go = Instantiate(Portal_Particle, new Vector3(ParentTransform.transform.position.x, ParentTransform.transform.position.y+0.5f, ParentTransform.transform.position.z), Quaternion.identity);

        Destroy(Particle_Go, 3);

    }

    private void OnTriggerExit(Collider other)
    {
        GButton.gameObject.SetActive(false);
    }

    float fTimeSum = 0;
    float fCoolgague = 3.0f;
    bool gague = false;
    private void Update()
    {
        if(Input.GetKeyDown(KeyCode.G)&&a)
        {
            while (true)
            {
                if (ParentTransform.parent == null)
                {
                    Debug.Log("비었음");
                    break;

                }
                else
                    ParentTransform = ParentTransform.parent;

            }

            PotalImage.gameObject.SetActive(true);
            Potalgague.gameObject.SetActive(true);


            gague = true;

            Particle_Stop = Instantiate(Portal_Particle, new Vector3(ParentTransform.transform.position.x, ParentTransform.transform.position.y+1, ParentTransform.transform.position.z), Quaternion.identity);
            Destroy(Particle_Stop, 3);

            Invoke("PotalMove", 3.0f);

            

        }
        if(gague)
        {
            fTimeSum += Time.deltaTime;
            Potalgague.fillAmount = (fCoolgague - fTimeSum) / fCoolgague;
            if(Potalgague.fillAmount <=0)
            {
                gague = false;
                fTimeSum = 0f;
                PotalImage.gameObject.SetActive(false);
                Potalgague.gameObject.SetActive(false);
            }
        }


    }

}
