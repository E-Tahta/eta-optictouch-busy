/*****************************************************************************
 *   Copyright (C) 2017 by Yunusemre Senturk                                 *
 *   <yunusemre.senturk@pardus.org.tr>                                       *
 *                                                                           *
 *   This program is free software; you can redistribute it and/or modify    *
 *   it under the terms of the GNU General Public License as published by    *
 *   the Free Software Foundation; either version 2 of the License, or       *
 *   (at your option) any later version.                                     *
 *                                                                           *
 *   This program is distributed in the hope that it will be useful,         *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *
 *   GNU General Public License for more details.                            *
 *                                                                           *
 *   You should have received a copy of the GNU General Public License       *
 *   along with this program; if not, write to the                           *
 *   Free Software Foundation, Inc.,                                         *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .          *
 *****************************************************************************/
#ifndef HELPER_H
#define HELPER_H

#include <QObject>

class SignalHandler;

class Helper : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool optictouch READ optictouch
               NOTIFY optictouchChanged
               NOTIFY terminateCalled)
public:
    explicit Helper(QObject *parent = 0);
    bool optictouch() const;
private:
    bool ot;
    SignalHandler *sh;
signals:
    void optictouchChanged();
    void terminateCalled();
public slots:
    void terminateSlot();

};

#endif // HELPER_H
