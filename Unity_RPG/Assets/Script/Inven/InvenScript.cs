using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
public class InvenScript : MonoBehaviour, IPointerDownHandler, IPointerUpHandler, IBeginDragHandler, IDragHandler, IEndDragHandler
{
	// Start is called before the first frame update

	public Image MoveIcon;
	public List<Slot> slotList = new List<Slot>();

	//이동시키고 있는 슬롯 번호
	int iWorkingSlot = -1;
	void Start()
	{

	}

	public void OnPointerDown(PointerEventData eventData)
	{
		MoveIcon.gameObject.SetActive(true);

		MoveIcon.rectTransform.position = eventData.position;



		Vector2 uiPos = eventData.position;
		Debug.Log("uiPos = " + uiPos);


		for (int i = 0; i < slotList.Count; i++)
		{

			if (uiPos.x >= slotList[i].rc.x &&
				uiPos.x <= slotList[i].rc.x + slotList[i].rc.width &&
				uiPos.y <= slotList[i].rc.y &&
				uiPos.y >= slotList[i].rc.y - slotList[i].rc.height)
			{

				Debug.Log(i.ToString() + "번째 슬롯");

				//선택한 슬롯에 보여지는 아이콘
				//선택한 슬롯의 아이템 정보
				string sprName = slotList[i].strIcon;

				MoveIcon.sprite = Resources.Load<Sprite>(sprName);
				slotList[i].icon.gameObject.SetActive(false);
				iWorkingSlot = i;
				break;

			}

		}
	}
	public void OnPointerUp(PointerEventData eventData)
	{

		int iUpSlotIndex = -1;
		Vector2 uiPos = eventData.position;

		for (int i = 0; i < slotList.Count; i++)
		{
			if (uiPos.x >= slotList[i].rc.x &&
				uiPos.x <= slotList[i].rc.x + slotList[i].rc.width &&
				uiPos.y <= slotList[i].rc.y &&
				uiPos.y >= slotList[i].rc.y - slotList[i].rc.height)
			{
				iUpSlotIndex = i;
				break;
			}
		}

		if (iUpSlotIndex == iWorkingSlot && iUpSlotIndex != -1)
		{
			slotList[iWorkingSlot].icon.gameObject.SetActive(true);
			MoveIcon.sprite = null;
			MoveIcon.gameObject.SetActive(false);
			iWorkingSlot = -1;
		}

		MoveIcon.gameObject.SetActive(false);
	}

	public void OnBeginDrag(PointerEventData eventData)
	{
		MoveIcon.rectTransform.position = eventData.position;
	}

	public void OnDrag(PointerEventData eventData)
	{
		MoveIcon.rectTransform.position = eventData.position;
	}
	public void OnEndDrag(PointerEventData eventData)
	{
		Vector2 uiPos = eventData.position;


		for (int i = 0; i < slotList.Count; i++)
		{
			if (uiPos.x >= slotList[i].rc.x &&
				uiPos.x <= slotList[i].rc.x + slotList[i].rc.width &&
				uiPos.y <= slotList[i].rc.y &&
				uiPos.y >= slotList[i].rc.y - slotList[i].rc.height)
			{

				//내려놓는곳의 슬롯 위치(정보를 가져올수 있다.)
				if (slotList[i].icon.sprite == null)
				{
					//현재 슬롯이 비어 있다면
					//작업중인 슬롯의 리소스를 가져와서 
					//내려놓는 슬롯의 아이콘정보에 올려놓는다.
					string strWorkspr = slotList[iWorkingSlot].strIcon;
					slotList[i].icon.sprite = Resources.Load<Sprite>(strWorkspr);

					slotList[i].icon.gameObject.SetActive(true);
					slotList[i].count.text = slotList[iWorkingSlot].count.text;

					slotList[iWorkingSlot].icon.sprite = null;

					slotList[iWorkingSlot].icon.gameObject.SetActive(false);


				}

				else
				{
					string strWorkspr = slotList[iWorkingSlot].icon.sprite.name;
					string tmpspr = slotList[i].icon.sprite.name;


					slotList[iWorkingSlot].icon.gameObject.SetActive(true);

					slotList[i].icon.sprite = Resources.Load<Sprite>(strWorkspr);


					slotList[iWorkingSlot].icon.sprite = Resources.Load<Sprite>(tmpspr);

					string iTmp = slotList[iWorkingSlot].count.text;
					slotList[iWorkingSlot].count.text = slotList[i].count.text;

					slotList[i].count.text = iTmp;


				}

				iWorkingSlot = -1;
				MoveIcon.sprite = null;
				MoveIcon.gameObject.SetActive(false);
				return;

			}

			else
			{

			}



		}
		slotList[iWorkingSlot].icon.gameObject.SetActive(true);
		MoveIcon.sprite = null;
		MoveIcon.gameObject.SetActive(false);
		iWorkingSlot = -1;

	}
	// Update is called once per frame
	void Update()
	{

	}
}
