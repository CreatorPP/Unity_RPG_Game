using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Slot : MonoBehaviour {

    public Rect rc;
    RectTransform tr;
    public Image icon;

    public Text count;

    private string _strIcon;

    public string strIcon
    {
        get
        {
            if (icon.sprite != null)
            {
                return icon.sprite.name;
            }
            else
                return null;
        }
    }
    // Start is called before the first frame update
    void Start()
    {
        tr = GetComponent<RectTransform>();

        //x와 y의 좌표를 좌상단으로 재구성
        rc.x = tr.position.x - tr.rect.width / 2;
        rc.y = tr.position.y + tr.rect.height / 2;

        rc.max = new Vector2(tr.rect.width, tr.rect.height);
        rc.width = tr.rect.width;
        rc.height = tr.rect.height;


    }

    // Update is called once per frame
    void Update()
    {

    }
}
