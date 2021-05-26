
SRC_IMGPATH := _assets/images
TARGET_IMGPATH := assets/images
PERCENT = 20%

SRC_IMAGES := $(wildcard $(SRC_IMGPATH)/*.jpg)
TARGET_IMAGES := $(patsubst $(SRC_IMGPATH)/%.jpg,$(TARGET_IMGPATH)/%.jpg,$(SRC_IMAGES))

ifeq ($(VERBOSE),1)
	V= 
else
	V=@ 
endif	

all: $(TARGET_IMAGES)

$(TARGET_IMGPATH)/%.jpg: $(SRC_IMGPATH)/%.jpg
	$Vecho converting $< to $@
	$Vconvert -resize $(PERCENT) $< $@