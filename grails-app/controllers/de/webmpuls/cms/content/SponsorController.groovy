package de.webmpuls.cms.content

import de.webmpuls.photo_album.Picture
import de.webmpuls.cms.media.MediaUtils
import de.webmpuls.photo_album.Album

class SponsorController
{

    def images =
	{
		Album sponsorenAlbum = Album.findByName(MediaUtils.ALBUM_SPONSOREN)
		def pictureList = []
		if(sponsorenAlbum)
		{
			pictureList = Picture.findAllByAlbum(sponsorenAlbum, [cache: true])
		}
		return [album: sponsorenAlbum, pictureList: pictureList]
	}
}
